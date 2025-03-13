//
//  ReceiptModel.swift
//  HelloRecipe
//
//  Created by Beka Batmanashvili on 11.03.25.
//

import SwiftUI

struct RecipeModel: Identifiable {
    let id: UUID = UUID()
    let images: [Image]
    var title: String
    var description: String
    var timestamp: Date = Date()
    var cookingTime: String?
    var status: RecipeStatus = .toCook
}

enum RecipeStatus {
    case toCook
    case cooking
    case cooked
    case deleted

    var displayTitle: String {
        switch self {
        case .toCook:
            return "To Cook"
        case .cooking:
            return "Currently Cooking"
        case .cooked:
            return "Cooked Recipes"
        case .deleted:
            return "Recycled Recipes"
        }
    }
}
