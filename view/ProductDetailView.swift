//
//  ProductDetailView.swift
//  TuniFy
//
//  Created by mohamed majdi ben saleh on 14/4/2023.
//

import SwiftUI

struct ProductDetailView: View {
    var product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AsyncImage(url: URL(string: product.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(maxWidth: .infinity)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.vertical, 10)

            VStack(alignment: .leading, spacing: 10) {
                Text(product.name)
                    .font(.title)
                
                Text("Price: $\(product.price)")
                    .font(.headline)
                    .foregroundColor(.green)
                
                Spacer()
                
                Button(action: {
                    // add to cart action
                }, label: {
                    Text("Add to Cart")
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .cornerRadius(10)
                })
            }
            .padding(.horizontal, 10)
            
            Spacer()
        }
        .navigationTitle("Product Detail")
    }
}
/*
struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: Product(_id: "1", name: "Product Name", price: 10.0, image: "", __v: 0))
    }
}
*/
