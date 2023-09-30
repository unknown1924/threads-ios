//
//  RegistrationView.swift
//  threads
//
//  Created by Debasis Mandal on 01/10/23.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @State private var username = ""
    
    var body: some View {
        VStack {
            
            Spacer()
            
            // App icon
            Image("threads-app-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            // login input form
            VStack {
                TextField("Full Name", text: $fullname)
                    .modifier(ThreadsTextFieldModifier())
                
                TextField("Username", text: $username)
                    .modifier(ThreadsTextFieldModifier())
                
                TextField("Email", text: $email)
                    .modifier(ThreadsTextFieldModifier())
                
                SecureField("Password", text: $password)
                    .modifier(ThreadsTextFieldModifier())
            }
            
            // signup button
            Button {
                Text("Registration")
            } label: {
                Text("Sign Up")
                    .modifier(ThreadsButtonModifier())
                    .padding()
            }
            .padding()
            
            Spacer()
            Divider()
            
            // sign up button
            NavigationLink {
                // dismiss current view
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    Text("Sign In")
                        .bold()
                }
                .padding(.vertical, 8)
                .font(.footnote)
                .foregroundStyle(.black)
            }
            
        }
        
    }
}

#Preview {
    RegistrationView()
}
