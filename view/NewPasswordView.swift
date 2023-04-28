//
//  NewPasswordView.swift
//  TuniFy
//
//  Created by mohamed majdi ben saleh on 14/4/2023.
//

import SwiftUI

struct NewPasswordView: View {
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showError: Bool = false
    @State private var showSuccess: Bool = false
    
    var body: some View {
        VStack {
            Text("Define New Password")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 30)
            
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 20)
            
            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 20)
            
            Button(action: {
                defineNewPassword()
            }, label: {
                Text("Define Password")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(5)
            })
            .padding(.top, 20)
            
            if showError {
                Text("Error: Passwords do not match. Please try again.")
                    .foregroundColor(.red)
                    .padding(.top, 20)
            }
            
            if showSuccess {
                Text("Your password has been successfully updated.")
                    .foregroundColor(.green)
                    .padding(.top, 20)
            }
            
            Spacer()
        }
        .padding(.top, 30)
    }
    
    func defineNewPassword() {
        if password == confirmPassword {
            // Call the backend API to update the password
            // Set the 'showError' and 'showSuccess' variables based on the result of the API call
        } else {
            showError = true
            showSuccess = false
        }
    }
}
