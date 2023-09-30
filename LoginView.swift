//
//  LoginView.swift
//  threads
//
//  Created by Debasis Mandal on 01/10/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
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
                    TextField("Enter your email", text: $email)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .modifier(ThreadsTextFieldModifier())
                    
                    SecureField("Enter your password", text: $password)
                        .modifier(ThreadsTextFieldModifier())
                }
                
                // forgot password link
                NavigationLink {
                    Text("Forgot Password")
                } label: {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                // login button
                Button {
                    Text("Forgot Password")
                } label: {
                    Text("Login")
                        .modifier(ThreadsButtonModifier())
                }
                Spacer()
                Divider()
                
                // sign up button
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden()
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .bold()
                    }
                    .padding(.vertical, 8)
                    .font(.footnote)
                    .foregroundStyle(.black)
                }
                
            }
        }
    }
}

#Preview {
    LoginView()
}
