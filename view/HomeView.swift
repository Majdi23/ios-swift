//
//  HomeView.swift
//  TuniFy
//
//  Created by mohamed majdi ben saleh on 14/4/2023.
//

import Alamofire
import SwiftUI
/*
struct HomeScreen: View {

    @State private var search=""
    let screenWidth = UIScreen.main.bounds.width
    let items = Array(1...50)
        let columns = [        GridItem(.flexible()),        GridItem(.flexible())    ]
    @StateObject var  homeViewModel=HomeViewModel()



    
    var body: some View {
          ScrollView {
              LazyVStack(spacing: 20) {
                  ForEach(homeViewModel.products, id: \.self) { product in
                      ProductRowView(product: product)
                  }
              }
              .padding()
          }
          .onAppear {
              homeViewModel.fetchProducts() {
                  _ in
              }
          }
      }
  }

  struct ProductRowView: View {
      var product: Product
      
      var body: some View {
          HStack(spacing: 15) {
              AsyncImage(url: URL(string: product.image)) { phase in
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
                  Text(product.name)
                      .font(.headline)
                      .lineLimit(2)
                  Text("$\(product.price, specifier: "%.2f")")
                      .font(.subheadline)
                      .foregroundColor(.gray)
              }
          }
      }
  }
*/


struct HomeScreen: View {

    @State private var search=""
    let screenWidth = UIScreen.main.bounds.width
    let items = Array(1...50)
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    @StateObject var  homeViewModel=HomeViewModel()

    @ObservedObject var cartManager = CartManager.shared
    
    var body: some View {
        VStack {
            Text("Products")
                .font(.title)
                .padding(.top, 10)
            
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(homeViewModel.products, id: \.self) { product in
                        ProductRowView(product: product)
                    }
                }
                .padding()
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
        }
        .onAppear {
            homeViewModel.fetchProducts() { _ in }
        }
    }
}

struct ProductRowView: View {
    var product: Product
    @ObservedObject var cartManager = CartManager.shared
    @StateObject var  homeViewModel=HomeViewModel()

    var body: some View {
        HStack(spacing: 15) {
            AsyncImage(url: URL(string: product.image)) { phase in
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
                Text(product.name)
                    .font(.headline)
                    .lineLimit(2)
                Text("$\(product.price, specifier: "%.2f")")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Button(action: {
                // add to cart logic
                cartManager.addToCart(product: product)
            }, label: {
                Image(systemName: "cart.badge.plus")
                    .font(.system(size: 20))
            })
            .frame(width: 40, height: 40)
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Circle())
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
