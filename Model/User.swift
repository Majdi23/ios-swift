//
//  User.swift
//  TuniFy
//
//  Created by mohamed majdi ben saleh on 14/4/2023.
//

import Foundation

struct User: Decodable {
    let _id: String
    let name: String
    let lastname: String
    let email: String
    let password: String
    let adress: String
    let phone: String
    let __v: Int
}

struct SignupRequest: Encodable {
    let name: String
    let lastname: String
    let email: String
    let password: String
    let adress: String
    let phone: String
}

struct LoginRequest: Encodable {
    let email: String
    let password: String
}

struct SignupResponse: Decodable {
    let status: String
    let message: String
}

struct ErrorResponse: Decodable {
    let message: String
}

struct LoginResponse: Decodable {
    let message: String
    let user: User
}
