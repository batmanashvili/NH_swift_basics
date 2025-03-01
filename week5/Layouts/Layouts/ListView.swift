//
//  ListView.swift
//  Layouts
//
//  Created by Beka Batmanashvili on 01.03.25.
//

import SwiftUI

struct Product: Codable {
    var id: String = UUID().uuidString
    let image: String
    let title: String
    let price: String
}

var productListData: [Product] = [
    Product(image: "https://picsum.photos/1200/900", title: "Wireless Headphones", price: "59.99"),
    Product(image: "https://picsum.photos/1200/900", title: "Smartphone", price: "799.99"),
    Product(image: "https://picsum.photos/1200/900", title: "Laptop", price: "1199.99"),
    Product(image: "https://picsum.photos/1200/900", title: "Smartwatch", price: "199.99"),
    Product(image: "https://picsum.photos/1200/900", title: "Gaming Console", price: "499.99"),
    Product(image: "https://picsum.photos/1200/900", title: "Bluetooth Speaker", price: "39.99"),
    Product(image: "https://picsum.photos/1200/900", title: "4K TV", price: "999.99"),
    Product(image: "https://picsum.photos/1200/900", title: "Mechanical Keyboard", price: "89.99"),
    Product(image: "https://picsum.photos/1200/900", title: "Wireless Mouse", price: "29.99"),
    Product(image: "https://picsum.photos/1200/900", title: "Tablet", price: "399.99")
]


struct ListView: View {
    var body: some View {
        NavigationSplitView{
            List{
                ForEach(productListData,id: \.id){product in
                    NavigationLink{
                        ProductDetail()
                    } label: {
                        ListItem(image: product.image, title: product.title, subTitle: product.price)
                    }
                }
            }.navigationTitle("Products")
        } detail: {
            Text("Select a product")
        }
    }
}

#Preview {
    ListView()
}
