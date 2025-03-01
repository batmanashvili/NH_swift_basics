//
//  HeaderRow.swift
//  Layouts
//
//  Created by Beka Batmanashvili on 01.03.25.
//

import SwiftUI

struct HeaderRow: View {
    var title: String;
    
    
    var body: some View {
        HStack{
            Text(title)
                .font(.title2)
            Spacer()
            CircleImage(size: 50)
        }
    }
}

#Preview {
    HeaderRow(title: "Item Details")
}
