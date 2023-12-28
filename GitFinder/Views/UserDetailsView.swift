//
//  UserDetailsView.swift
//  GitFinder
//
//  Created by Charles Yamamoto on 2023/12/26.
//

import SwiftUI

struct UserDetailsView: View {
    let userData: UserData?
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: userData?.avatarUrl ?? "")) { image in
                image.resizable()
                    .scaledToFit()
                    .clipShape(Circle())
            } placeholder: {
                Circle()
                    .foregroundStyle(.gray)
            }
            .frame(width: 124, height: 124)
            
            Text(userData?.login ?? "No Nickname")
                .font(.title3)
                .bold()
            Text(userData?.name ?? "")
         
            
            Text(userData?.bio ?? "No bio")
            Text(userData?.createdAt ?? "")
            Text(userData?.updatedAt ?? "")
            Text(userData?.url ?? "")
            Text(userData?.followersUrl ?? "")
            
            Spacer()
        }.padding()
    }
}

#Preview {
    UserDetailsView(userData: MockData.sampleUserData)
}
