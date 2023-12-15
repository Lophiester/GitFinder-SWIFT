//
//  ContentView.swift
//  GitFinder
//
//  Created by Charles Yamamoto on 2023/12/15.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack(spacing: 20) {
            Circle()
                .foregroundStyle(.gray)
                .frame(width: 124,height: 124)
            Text("Username")
                .font(.title3)
                .bold()
            Text("This is where the github bio will go.")
            Spacer()
        }
        .padding()
    }
}
#Preview {
    ContentView()
}


struct UserData: Codable{
    let login : String
    let avatarUrl : String
    let bio : String
}

