//
//  SignUpView.swift
//  TuniFy
//
//  Created by mohamed majdi ben saleh on 14/4/2023.
//

import Alamofire
import SwiftUI

struct SignUpView: View {
    
    @State private var isPresented = false
    
    @State private var name = ""
    @State private var lastname = ""
    @State private var email = ""
    @State private var password = ""
    @State private var adress = ""
    @State private var phone = ""
    
    
    
    
    @ObservedObject var viewModel = SignupViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    
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
                    .padding(.bottom, 30)
                
                Text("Sign Up")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                
                HStack {
                    TextField("First Name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 20)
                    TextField("Last Name", text: $lastname)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal, 20)
                }
                .padding(.bottom, 20)
                
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                
                TextField("Address", text: $adress)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                
                TextField("Phone Number", text: $phone)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                
                Button(action: {
                    
                    let request = SignupRequest(name: name,lastname: lastname, email: email, password: password, adress: adress, phone: phone)
                    viewModel.signup(request: request) { result in
                        switch result {
                        case .success(let response):
                        // Handle successful sign up
                        print(response)
                        // Dismiss the sign in view after successful sign up
                        presentationMode.wrappedValue.dismiss()
                        
                        // Redirect to login page
                        presentationMode.wrappedValue.dismiss() // dismiss the current view
                        isPresented = false // set isPresented to false to dismsheet
                        
                        case .failure(let error):
                        // Handle error
                        print(error.localizedDescription)
                        }
                    }
                }) {
                     Text("Sign Up")
                        .foregroundColor(.white)
                        .font(.headline)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 47/255, green: 216/255, blue: 128/255))
                        .cornerRadius(5)
                        .padding(.horizontal, 20)
                    
                    
                }
                
                NavigationLink(destination: LoginView(), isActive: $isPresented) {
                EmptyView()
                }
                        
                
                
            }
        }
      }
    }
}

