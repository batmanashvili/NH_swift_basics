//
//  CircleImage.swift
//  Layouts
//
//  Created by Beka Batmanashvili on 26.02.25.
//

import SwiftUI

struct CircleImage: View {
    var size: Int
    
    init(size: Int = 100) {
        self.size = size
    }
    
    var body: some View {
        Image("BackgroundImage")
            .resizable()
            .scaledToFit()
            .frame(width: CGFloat(size), height: CGFloat(size))
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    CircleImage()
}
