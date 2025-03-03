//
//  story.swift
//  week6
//
//  Created by Beka Batmanashvili on 03.03.25.
//

import Foundation

let baseUrl = "https://hacker-news.firebaseio.com"
let topStoriesUrl = "/v0/topstories.json?print=pretty"


func fetchTopStoryIDs(completion: @escaping ([Int]?) -> Void) {
    let urlString = baseUrl + topStoriesUrl
    guard let url = URL(string: urlString) else {
        print("Invalid URL")
        completion(nil)
        return
    }
    
    let task = URLSession.shared.dataTask(with: url){ data, response, error in
        
        if let error = error {
            print("Error fetching data: \(error)")
            completion(nil)
            return
        }
        
        guard let data = data else {
            print("No data received")
            completion(nil)
            return
        }
        
        do {
            let storyIDs = try JSONDecoder().decode([Int].self, from: data)
            completion(storyIDs)
        } catch {
            print("Error decoding JSON: \(error)")
            completion(nil)
        }
        
    }
    
    task.resume()
}

func fetchStoryDetails(storyId: Int, completion: @escaping (StoryModel?) -> Void) {
    let urlString = baseUrl + "/v0/item/\(storyId).json?print=pretty"
    
    guard let url = URL(string: urlString) else {
        print("Invalid URL")
        completion(nil)
        return
    }
    
    let task = URLSession.shared.dataTask(with: url){data, response, error in
        
        if let error = error {
            print("Error fetching data: \(error)")
            completion(nil)
            return
        }
        
        guard let data = data else {
            print("No data received")
            completion(nil)
            return
        }
        
        do {
            let storyDetails = try JSONDecoder().decode(StoryModel.self, from: data)
            completion(storyDetails)
        } catch {
            print("Error decoding JSON: \(error)")
            completion(nil)
        }
        
        
    }
    
    task.resume()
}
