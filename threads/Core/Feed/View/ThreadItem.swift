//
//  ThreadItem.swift
//  threads
//
//  Created by Debasis Mandal on 01/10/23.
//

import SwiftUI

struct ThreadItem: View {
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image("cat")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                //                Spacer()
                
                VStack(alignment: .leading, spacing: 2) {
                    HStack {
                        Text("the_catonator")
                            .font(.body)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("12m")
                            .font(.caption)
                            .foregroundStyle(.gray)
                        Button {
                            
                        } label: {
                            Image(systemName: "ellipsis")
                                .bold()
                                .foregroundStyle(.black)
                        }
                    }
                    
                    Text("I am God. Humans worship me.")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 16) {
                        Button {
                        } label: {
                            Image(systemName: "heart")
                        }
                        
                        Button {
                        } label: {
                            Image(systemName: "bubble.right")
                        }
                        
                        Button {
                        } label: {
                            Image(systemName: "arrow.rectanglepath")
                        }
                        
                        Button {
                        } label: {
                            Image(systemName: "paperplane")
                        }
                    }
                    .padding(.vertical, 8)
                    .tint(.black)
                }
            }
            
            Divider()
        }
        .padding(12)
    }
}

#Preview {
    ThreadItem()
}
