
import SwiftUI

struct RecipeSection: View {
    let title: String
    let recipes: [RecipeModel]

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 16) {
                    ForEach(recipes) { recipe in
                        RecipeCard(recipe: recipe)
                            .frame(width: 200)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    RecipeSection(
        title: "To Cook",
        recipes: [
            RecipeModel(
                images: [Image(systemName: "photo")], title: "Recipe 1", description: "Description 1")
        ]
    )
}
