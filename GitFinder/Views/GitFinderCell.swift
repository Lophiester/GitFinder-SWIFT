//
//  GitFinderCell.swift
//  GitFinder
//
//  Created by Charles Yamamoto on 2023/12/18.
//

import SwiftUI

struct GitFinderCell: View {
    
    let userData : UserData?
    
    
    var body: some View {
        VStack(spacing: 20){
            AsyncImage(url: URL(string: userData?.avatarUrl ?? "No Image")) { image in
                image.resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                
            } placeholder: {
                Circle()
                    .foregroundStyle(.gray)
            }
            .frame(width: 124,height: 124)
            Text(userData?.login ?? "No Nickname")
                .font(.title3)
                .bold()
            Text(userData?.bio ?? "No bio")
            Spacer()
        }.padding()
    }
}

#Preview {
    GitFinderCell(userData: MockData.sampleUserData)
}
