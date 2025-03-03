//
//  ListItem.swift
//  Layouts
//
//  Created by Beka Batmanashvili on 01.03.25.
//

import SwiftUI

struct ListItem: View {
    var title: String
    var author: String
    var date: Date
    var redirectUrl: URL?
    
    init(title: String?, author: String?, date: Int, redirectUrl: String?) {
        self.title = title ?? ""
        self.author = author ?? ""
        self.date = Date(timeIntervalSince1970: TimeInterval(date))
        self.redirectUrl = URL(string: redirectUrl ?? "")
    }
    
    private var formattedDate: String {
        let dtFormatter = DateFormatter()
        dtFormatter.dateFormat = "dd.MM.yy HH:mm"
        dtFormatter.timeZone = TimeZone.current
        return dtFormatter.string(from: date)
    }
    
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                HStack(alignment: .top){
                    Text(title).font(.title3).padding(.bottom, 1).padding(.trailing, 20).lineLimit(2)
                    Spacer()
                    Button(action: {
                        if let redirectUrl = redirectUrl {
                            UIApplication.shared.open(redirectUrl)
                        }
                    }, label: {
                        Image(systemName: "arrowshape.turn.up.forward")
                    })
                }
                HStack{
                    Text("Author: \(author)").font(.callout)
                    Spacer()
                    Text(formattedDate)
                }
                
            }
        }
    }
}

#Preview {
    ListItem(title: "Hacking the Xbox 360 Hypervisor Part 2: The Bad Update Exploit", author: "John Doe", date: 1741007661, redirectUrl: "http://www.interdb.jp/pg/index.html")
}
