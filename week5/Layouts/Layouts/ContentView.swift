//
//  ContentView.swift
//  Layouts
//
//  Created by Beka Batmanashvili on 26.02.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text("Hello Swift UI!")
                    .font(.title2)
                Spacer()
                CircleImage(size: 50)
            }
            Text("Hello Swift UI!")
                .font(.title)
                .foregroundColor(Color.yellow)
        }.padding()
        
        
    }
}

#Preview {
    ContentView()
}
