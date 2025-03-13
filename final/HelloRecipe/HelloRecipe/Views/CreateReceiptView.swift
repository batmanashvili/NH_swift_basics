//
//  CreateReceipt.swift
//  HelloRecipe
//
//  Created by Beka Batmanashvili on 10.03.25.
//

import PhotosUI
import SwiftUI

struct CreateReceipt: View {
    @EnvironmentObject var recipeViewModel: RecipeViewModel

    @State private var title: String = ""
    @State private var description: String = ""
    @State private var cookingTime: String = ""

    @State private var showTitleError: Bool = false
    @State private var showDescriptionError: Bool = false

    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var selectedImages: [Image] = []

    private let MAX_IMAGE_COUNT = 5

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Title", text: $title)
                        .onChange(of: title) { oldValue, newValue in
                            showTitleError = newValue.isEmpty
                        }
                    if showTitleError {
                        Text("Title is required")
                            .foregroundColor(.red)
                            .font(.caption)
                    }

                    TextField("Description", text: $description)
                        .onChange(of: description) { oldValue, newValue in
                            showDescriptionError = newValue.isEmpty
                        }
                    if showDescriptionError {
                        Text("Description is required")
                            .foregroundColor(.red)
                            .font(.caption)
                    }

                    TextField("Cooking Time (Optional)", text: $cookingTime)
                }

                Section {
                    VStack(alignment: .leading) {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                if selectedImages.count < MAX_IMAGE_COUNT {
                                    PhotosPicker(
                                        selection: $selectedItems,
                                        maxSelectionCount: MAX_IMAGE_COUNT,
                                        matching: .images
                                    ) {
                                        VStack {
                                            Image(systemName: "photo")
                                                .font(.system(size: 30))
                                            Text("Add Photo")
                                                .font(.caption)
                                        }
                                        .frame(width: 100, height: 100)
                                        .background(Color.gray.opacity(0.1))
                                        .cornerRadius(10)
                                    }
                                    .onChange(of: selectedItems) { oldValue, newValue in
                                        Task {
                                            var newImages: [Image] = []
                                            for item in newValue {
                                                if let image = try? await item.loadTransferable(
                                                    type: Image.self)
                                                {
                                                    newImages.append(image)
                                                }
                                            }
                                            selectedImages = newImages
                                        }
                                    }
                                }

                                ForEach(Array(selectedImages.enumerated()), id: \.offset) {
                                    index, image in
                                    ZStack {
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 100, height: 100)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))

                                        Button(action: {
                                            selectedImages.remove(at: index)
                                            selectedItems.remove(at: index)
                                        }) {
                                            Image(systemName: "trash")
                                                .foregroundColor(.white)
                                                .padding(4)
                                                .background(Circle().fill(Color.red))
                                        }.offset(x: 45, y: -45)
                                    }
                                }
                            }
                            .padding(.vertical, 8)
                        }

                        if !selectedImages.isEmpty {
                            Text("\(selectedImages.count)/5 photos")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }

                Button("Save Receipt") {
                    validateAndSave()
                }
            }
            .navigationTitle("Create Receipt")
        }
    }

    private func validateAndSave() {
        showTitleError = title.isEmpty
        showDescriptionError = description.isEmpty

        if !title.isEmpty && !description.isEmpty {
            let newRecipe = RecipeModel(
                images: selectedImages, title: title,
                description: description,
                cookingTime: cookingTime
            )
            recipeViewModel.addRecipe(newRecipe)
        }
    }
}

#Preview {
    CreateReceipt()
}
