//
//  Modal.swift
//  week6
//
//  Created by Beka Batmanashvili on 02.03.25.
//

import SwiftUI


struct Modal: View {
    @State var isModalVisisble = false
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                Text(loremText)
                Spacer()
                Button("Press me to open modal", action: {
                    print("oepn")
                    isModalVisisble = true
                })
                Spacer()
            }.padding()
        }.overlay(alignment: .bottom){
            if isModalVisisble {
                Rectangle().fill(Color.black).opacity(0.7).ignoresSafeArea()
                VStack{
                    Text(loremText).padding()
                    Button(action: {
                        isModalVisisble = false
                    }, label: {
                        Image(systemName: "x.circle")
                        Text("Close")
                    }).padding()
                    
                }.background(Color.white).cornerRadius(20)
            }
            
        }
    }
}

#Preview {
    Modal()
}
