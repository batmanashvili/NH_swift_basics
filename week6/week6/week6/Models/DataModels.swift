//
//  DataModels.swift
//  week6
//
//  Created by Beka Batmanashvili on 03.03.25.
//


struct StoryModel: Codable, Identifiable {
    let id: Int
    let by: String
    let descendants: Int?
    let kids: [Int]?
    let score: Int
    let time: Int
    let title: String
    let type: String
    let url: String?
}


