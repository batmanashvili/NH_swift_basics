//
//  ListItem.swift
//  Layouts
//
//  Created by Beka Batmanashvili on 01.03.25.
//

import SwiftUI

struct ListItem: View {
    var image: String?
    var title: String
    var subTitle: String?
    
    var body: some View {
        HStack{
            if let imgUri = image{
                AsyncImage(url: URL(string: imgUri))
                    .frame(width: 44, height: 44)
                    .cornerRadius(12)
            }else{
                Image("BackgroundImage")
                    .resizable()
                    .frame(width: 44, height: 44)
                    .cornerRadius(12)
            }
            VStack(alignment: .leading){
                Text(title).font(.body)
                if let subTitle = subTitle{
                    Text(subTitle).font(.callout)
                }
            }
            Spacer()
        }
    }
}

#Preview {
    ListItem(title: "Item 1", subTitle: "titleee")
}
