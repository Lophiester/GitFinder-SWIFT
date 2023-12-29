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
            
            VStack(spacing: 15){
                Text(userData?.login ?? "No Nickname")
                    .font(.largeTitle)
                    .bold()
                Text(userData?.name ?? "").font(.headline)
                Text(userData?.bio ?? "No bio").font(.subheadline)
                Divider()
                VStack{
                    HStack{
                        Text("Created at:")
                        Text(userData?.createdAt ?? "")}.font(.caption)
                    HStack{
                        Text("Updated at:")
                        Text((userData?.updatedAt ?? ""))}.font(.caption)
                    HStack{
                        Text("Followers:")
                        Text(String(userData?.followers ?? 0))}.font(.caption)
                    HStack{
                        Text("Following:")
                        Text(String(userData?.following ?? 0))}.font(.caption)
                }.multilineTextAlignment(.leading)
                NavigationLink(destination: SearchableView( username: userData?.login ?? "")) {
                    Text("View Followers")
                }
                NavigationLink(destination: WebkitView(urlString: userData?.htmlUrl ?? "No URL")) {
                    Text("gitHub link")
                        .padding()
                }
            }
            Spacer()
        }.padding()
    }
}

#Preview {
    UserDetailsView(userData: MockData.sampleUserData)
}
