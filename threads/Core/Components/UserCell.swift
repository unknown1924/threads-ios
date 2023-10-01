//
//  UserCell.swift
//  threads
//
//  Created by Debasis Mandal on 01/10/23.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack(alignment: .top) {
            CircularProfileView()
            
            VStack(alignment: .leading, spacing: 2) {
                Text("the_catonator")
                    .font(.body)
                    .fontWeight(.semibold)
                
                Text("Kali Katnip")
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
            }
            
            Spacer()
            
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 100, height: 32)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color(.systemGray4))
                }
            
            //                                Button {
            //                                    // Action
            //                                } label: {
            //                                    Text("Follow")
            //                                        .font(.subheadline)
            //                                        .fontWeight(.semibold)
            //                                        .foregroundStyle(.white)
            //                                        .padding(.horizontal)
            //                                }
            //                                .buttonStyle(.bordered)
            //                                .background(.black)
            //                                .clipShape(.rect(cornerRadius: 10))
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserCell()
}
