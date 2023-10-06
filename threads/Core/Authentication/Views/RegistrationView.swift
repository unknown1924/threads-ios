//
//  RegistrationView.swift
//  threads
//
//  Created by Debasis Mandal on 01/10/23.
//

import SwiftUI

struct RegistrationView: View {
    
    @StateObject var viewModel = RegistrationViewModel()
    
    @Environment(\.dismiss) var dismiss
    
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
                TextField("Full Name", text: $viewModel.fullname)
                    .modifier(ThreadsTextFieldModifier())
                    .autocorrectionDisabled()
                
                TextField("Username", text: $viewModel.username)
                    .modifier(ThreadsTextFieldModifier())
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                
                TextField("Email", text: $viewModel.email)
                    .modifier(ThreadsTextFieldModifier())
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                
                SecureField("Password", text: $viewModel.password)
                    .modifier(ThreadsTextFieldModifier())
            }
            
            // signup button
            Button {
                Task { try await viewModel.createUser() }
            } label: {
                Text("Sign Up")
                    .modifier(ThreadsButtonModifier())
                    .padding()
            }
            .padding()
            
            Spacer()
            Divider()
            
            // sign up button
            Button {
                // dismiss current view
                dismiss()
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
