//
//  Receipt.swift
//  HelloRecipe
//
//  Created by Beka Batmanashvili on 10.03.25.
//

import SwiftUI

struct RecipeCard: View {
    let recipe: RecipeModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 0) {
                    ForEach(Array(recipe.images.enumerated()), id: \.offset) { index, image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 120)  // Match card width
                            .clipped()
                    }
                }
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(recipe.title)
                    .font(.headline)

                Text(recipe.description)
                    .font(.subheadline)
                    .lineLimit(2)
                    .foregroundColor(.secondary)

                if let cookingTime = recipe.cookingTime {
                    Text(cookingTime)
                        .font(.caption)
                        .foregroundColor(.blue)
                }
            }
            .padding(.horizontal, 8)
            .padding(.bottom, 8)

        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}

#Preview {
    RecipeCard(
        recipe: RecipeModel(
            images: [Image(systemName: "photo")],
            title: "Recipe Title",
            description: "Recipe Description",
            cookingTime: "10 minutes"
        )
    )
}
