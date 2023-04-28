//
//  ProfileView.swift
//  TuniFy
//
//  Created by mohamed majdi ben saleh on 14/4/2023.
//

import SwiftUI

struct UserProfileView: View {
    @State private var image: UIImage?
    @State private var name: String = "John Doe"
    @State private var email: String = "johndoe@example.com"
    @State private var address: String = "123 Main St"
    @State private var phoneNumber: String = "555-555-5555"
    
    var body: some View {
        VStack {
            Image(uiImage: image ?? UIImage(systemName: "person.fill")!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 1))
                .padding(.top, 30)
                .onTapGesture {
                    // TODO: Present image picker
                }
            
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("Name", text: $name)
                    TextField("Email", text: $email)
                    TextField("Address", text: $address)
                    TextField("Phone Number", text: $phoneNumber)
                }
            }
            
            Button("Update Profile") {
                // TODO: Update user's data
            }
            .buttonStyle(RoundedRectangleButtonStyle())
            .padding(.top, 20)
            
            Spacer()
        }
        .navigationBarTitle("Profile")
    }
}
/*
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
*/
struct RoundedRectangleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .background(configuration.isPressed ? Color.gray : Color.blue)
            .cornerRadius(10)
    }
}
