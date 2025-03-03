//
//  CircleList.swift
//  week6
//
//  Created by Beka Batmanashvili on 02.03.25.
//

import SwiftUI

var randomColor: Color {
    Color(red: .random(in: 0...1),
          green: .random(in: 0...1),
          blue: .random(in: 0...1))
}

struct CircleList: View {
    var containerSize: CGFloat = 100
    var circleAmount: Int = 10
    
    let screenWidth: CGFloat = UIScreen.main.bounds.width
    let screenHeight: CGFloat = UIScreen.main.bounds.height

    func calculateNextPosition(index: Int) -> CGPoint {
        let centerX = screenWidth / 2
        let centerY = screenHeight / 2
        let angle = (2 * .pi / CGFloat(circleAmount)) * CGFloat(index)

        let x = centerX + containerSize * cos(angle)
        let y = centerY + containerSize * sin(angle)

        return CGPoint(x: x, y: y)
    }
    
    var body: some View {
        ZStack{
            ForEach(0..<circleAmount, id: \.self) { index in
                Circle()
                    .fill(randomColor)
                    .frame(width: 30, height: 30)
                    .position(calculateNextPosition(index: index))
            }
        }
    }
}

#Preview {
    CircleList()
}
