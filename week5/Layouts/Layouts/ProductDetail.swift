//
//  ProductDetail.swift
//  Layouts
//
//  Created by Beka Batmanashvili on 01.03.25.
//

import SwiftUI

struct ProductDetail: View {
    var loremIpsumText = """
    Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
    """
    
    var body: some View {
        VStack(alignment: .leading) {
            HeaderRow(title: "Hello Swift UI!")
            Image("Carousel").resizable().frame( height: 300).cornerRadius(20)
            Text(loremIpsumText).font(.body)
            Image("Carousel").resizable().frame( height: 300).cornerRadius(20)
        }.padding()
    }
}

#Preview {
    ProductDetail()
}
