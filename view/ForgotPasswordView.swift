//
//  ForgotPasswordView.swift
//  TuniFy
//
//  Created by mohamed majdi ben saleh on 14/4/2023.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State private var email: String = ""
    @State private var showError: Bool = false
    @State private var showSuccess: Bool = false
    
    var body: some View {
        VStack {
            Text("Reset Password")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 30)
            
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal, 20)
            
            Button(action: {
                resetPassword()
            }, label: {
                Text("Reset Password")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(5)
            })
            .padding(.top, 20)
            
            if showError {
                Text("Error: Failed to reset password. Please try again.")
                    .foregroundColor(.red)
                    .padding(.top, 20)
            }
            
            if showSuccess {
                Text("Password reset instructions have been sent to your email.")
                    .foregroundColor(.green)
                    .padding(.top, 20)
            }
            
            Spacer()
        }
        .padding(.top, 30)
    }
    
    func resetPassword() {
        // Call the backend API to reset the password using the entered email address
        // Set the 'showError' and 'showSuccess' variables based on the result of the API call
    }
}
