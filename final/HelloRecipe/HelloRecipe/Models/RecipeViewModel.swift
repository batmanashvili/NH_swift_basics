import SwiftUI

class RecipeViewModel: ObservableObject {
    @Published private(set) var recipes: [RecipeModel] = []

    var toCookRecipes: [RecipeModel] {
        recipes.filter { $0.status == .toCook }
            .sorted { $0.timestamp > $1.timestamp }
    }

    var cookingRecipes: [RecipeModel] {
        recipes.filter { $0.status == .cooking }
            .sorted { $0.timestamp > $1.timestamp }
    }

    var cookedRecipes: [RecipeModel] {
        recipes.filter { $0.status == .cooked }
            .sorted { $0.timestamp > $1.timestamp }
    }

    var deletedRecipes: [RecipeModel] {
        recipes.filter { $0.status == .deleted }
            .sorted { $0.timestamp > $1.timestamp }
    }

    func addRecipe(_ recipe: RecipeModel) {
        recipes.append(recipe)
    }

    func deleteRecipe(_ recipe: RecipeModel) {
        if let index = recipes.firstIndex(where: { $0.id == recipe.id }) {
            var updatedRecipe = recipe
            updatedRecipe.status = .deleted
            recipes[index] = updatedRecipe
        }
    }

    func permanentlyDeleteRecipe(_ recipe: RecipeModel) {
        recipes.removeAll { $0.id == recipe.id }
    }

    func updateRecipeStatus(_ recipe: RecipeModel, to status: RecipeStatus) {
        if let index = recipes.firstIndex(where: { $0.id == recipe.id }) {
            var updatedRecipe = recipe
            updatedRecipe.status = status
            recipes[index] = updatedRecipe
        }
    }

    func startCooking(_ recipe: RecipeModel) {
        updateRecipeStatus(recipe, to: .cooking)
    }

    func markAsCooked(_ recipe: RecipeModel) {
        updateRecipeStatus(recipe, to: .cooked)
    }

    func restoreRecipe(_ recipe: RecipeModel) {
        updateRecipeStatus(recipe, to: .toCook)
    }

    func recipesForStatus(_ status: RecipeStatus) -> [RecipeModel] {
        recipes.filter { $0.status == status }
            .sorted { $0.timestamp > $1.timestamp }
    }
}
