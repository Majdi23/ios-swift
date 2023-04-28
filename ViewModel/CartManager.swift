//
//  CartManager.swift
//  TuniFy
//
//  Created by mohamed majdi ben saleh on 19/4/2023.
//

import Foundation
import UIKit

class CartManager: ObservableObject {
    static let shared = CartManager()

    private let userDefaults = UserDefaults.standard
    private let cartKey = "cart"

    var cart: [Product] {
        get {
            if let cartData = userDefaults.data(forKey: cartKey),
               let cart = try? JSONDecoder().decode([Product].self, from: cartData) {
                return cart
            }
            return []
        }
        set {
            if let cartData = try? JSONEncoder().encode(newValue) {
                userDefaults.set(cartData, forKey: cartKey)
            }
        }
    }

    func addToCart(product: Product) {
        var currentCart = cart
        currentCart.append(product)
        cart = currentCart
    }

    func removeFromCart(product: Product) {
        var currentCart = cart
        if let index = currentCart.firstIndex(of: product) {
            currentCart.remove(at: index)
        }
        cart = currentCart
    }

    func saveCart() {
        if let cartData = try? JSONEncoder().encode(cart) {
            userDefaults.set(cartData, forKey: cartKey)
        }
    }

    func loadCart() -> [Product] {
        if let cartData = userDefaults.data(forKey: cartKey),
           let cart = try? JSONDecoder().decode([Product].self, from: cartData) {
            return cart
        }
        return []
    }

    func clearCart() {
        cart = []
    }
}
