//
//  CartView.swift
//  TuniFy
//
//  Created by mohamed majdi ben saleh on 14/4/2023.
//

import SwiftUI
import UIKit

struct CartView: View {
    @ObservedObject var cartManager = CartManager.shared
    
    var body: some View {
        VStack {
            Text("Cart")
                .font(.largeTitle)
                .padding()

            if cartManager.cart.isEmpty {
                Text("Your cart is empty.")
                    .foregroundColor(.gray)
                    .font(.title)
            } else {
                List(cartManager.cart, id: \.self) { item in
                    HStack {
                        AsyncImage(url: URL(string: item.image)) { phase in
                            switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            case .failure:
                                Image(systemName: "xmark.square")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(.red)
                            @unknown default:
                                fatalError()
                            }
                        }
                        .frame(width: 80, height: 80)
                        .clipShape(RoundedRectangle(cornerRadius: 12))

                        VStack(alignment: .leading, spacing: 5) {
                            Text(item.name)
                                .font(.headline)
                                .lineLimit(2)
                            Text("$\(item.price, specifier: "%.2f")")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }

                        Spacer()

                        Button(action: {
                            cartManager.removeFromCart(product: item)
                        }, label: {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        })
                    }
                    .padding(.vertical, 8 )
                }

                Button(action: {
                    cartManager.clearCart()
                }, label: {
                    Text("Clear Cart")
                        .foregroundColor(.red)
                        .font(.headline)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(Color.white)
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.red, lineWidth: 2)
                        )
                        .padding(.bottom, 20)
                })
            }

            Spacer()
        }
        .padding()
    }
}
