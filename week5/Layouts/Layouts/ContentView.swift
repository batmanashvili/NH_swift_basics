//
//  ContentView.swift
//  Layouts
//
//  Created by Beka Batmanashvili on 26.02.25.
//

import SwiftUI



struct ContentView: View {
    @State private var isAuthenticated = false
    
    
    var body: some View {
        if isAuthenticated {
            ListView()
        }else{
            SignInLayout(isAuthenticated: $isAuthenticated)
        }
    }
}

#Preview {
    ContentView()
}
