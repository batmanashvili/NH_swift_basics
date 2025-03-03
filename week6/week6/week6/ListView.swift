//
//  ListView.swift
//  Layouts
//
//  Created by Beka Batmanashvili on 01.03.25.
//

import SwiftUI


struct ListView: View {
    @State private var topStories: [StoryModel?] = []
    
    var body: some View {
        Text("Breaking News").font(.title)
        
        List{
            ForEach(topStories,id: \.?.id){story in
                if let story = story{
                    ListItem(title: story.title, author: story.by, date: story.time, redirectUrl: story.url)
                }
            }
        }.onAppear{
            fetchTopStoryIDs { ids in
                if let ids = ids {
                    let topTen = ids.prefix(10)
                    print("ids \(topTen)")
                    
                    for id in topTen {
                        fetchStoryDetails(storyId: id){ story in
                            if let story = story {
                                topStories.append(story)
                            }else {
                                print("Failed to fetch story details")
                            }
                        }
                    }
                    
                }
            }
        }
    }
}

#Preview {
    ListView()
}
