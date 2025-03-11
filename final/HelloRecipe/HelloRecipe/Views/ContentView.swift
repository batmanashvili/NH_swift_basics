//
//  ContentView.swift
//  HelloRecipe
//
//  Created by Beka Batmanashvili on 10.03.25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    Spacer()
                    NavigationLink(destination: Receipt()){
                        Image(systemName: "plus")
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                        Text("Add New")
                    }.padding(.trailing)
                }
                Spacer()
                VStack(alignment: .leading) {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Hello, world!")
                    NavigationLink(destination: Receipt()){
                        Text("press me")
                    }
                }
                .padding()
                Spacer()
            }
        }
        
    }
}

#Preview {
    ContentView()
}
