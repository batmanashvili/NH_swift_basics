//
//  RecipeList.swift
//  HelloRecipe
//
//  Created by Beka Batmanashvili on 10.03.25.
//

import SwiftUI

struct RecipeListView: View {
    @EnvironmentObject var recipeViewModel: RecipeViewModel

    var body: some View {
        NavigationView {

            ScrollView {
                HStack {
                    Spacer()
                    NavigationLink(destination: CreateReceipt()) {
                        Image(systemName: "plus")
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                        Text("Add New")
                    }.padding(.trailing)
                }

                VStack(spacing: 24) {
                    if !recipeViewModel.cookingRecipes.isEmpty {
                        RecipeSection(
                            title: RecipeStatus.cooking.displayTitle,
                            recipes: recipeViewModel.cookingRecipes
                        )
                    }

                    if !recipeViewModel.toCookRecipes.isEmpty {
                        RecipeSection(
                            title: RecipeStatus.toCook.displayTitle,
                            recipes: recipeViewModel.toCookRecipes
                        )
                    }

                    if !recipeViewModel.cookedRecipes.isEmpty {
                        RecipeSection(
                            title: RecipeStatus.cooked.displayTitle,
                            recipes: recipeViewModel.cookedRecipes
                        )
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Recipes")
        }

    }
}

#Preview {
    RecipeListView()
}
