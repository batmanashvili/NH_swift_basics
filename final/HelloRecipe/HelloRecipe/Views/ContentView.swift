//
//  ContentView.swift
//  HelloRecipe
//
//  Created by Beka Batmanashvili on 13.03.25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var recipeViewModel = RecipeViewModel()

    var body: some View {
        NavigationView {
            RecipeListView()
        }
        .environmentObject(recipeViewModel)
    }
}

#Preview {
    ContentView()
}
