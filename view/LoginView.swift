//
//  LoginView.swift
//  TuniFy
//
//  Created by mohamed majdi ben saleh on 13/4/2023.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var loginViewModel = LoginViewModel()
    
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible = false
    @State private var loginSuccess = false
    @State var redirectToHomeView = false
    @State private var isForgotPasswordLinkTapped = false
    
    
    var body: some View {
        NavigationView{
        ZStack {
            Color(red: 36/255, green: 37/255, blue: 44/255)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("logo2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding(.bottom, 40)
                
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                
                HStack {
                    Spacer()
                    Text("Forgot password ?")
                        .foregroundColor(.white)
                        .padding(.trailing, 20)
                }
                
                Button(action: {
                    let request = LoginRequest(email: email, password: password)
                                            loginViewModel.login(request: request) { result in
                                                switch result {
                                                case .success(let response):
                                                    // Action si la connexion est réussie
                                                    print(response)
                                                    self.loginSuccess = true // Set login success to true
                                                    self.redirectToHomeView = true // Set redirectToHomePage to true
                                                case .failure(let error):
                                                    // Action si la connexion échoue
                                                    print(error)
                                                }
                                            }                }) {
                    Text("Login")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 47/255, green: 216/255, blue: 128/255))
                        .cornerRadius(5)
                        .padding(.horizontal, 20)
                }
                
                if loginSuccess {
                    NavigationLink(destination: HomeScreen(), isActive: $redirectToHomeView) {
                        EmptyView()
                        }
                }

                
            }
        }
        }
    }
}
