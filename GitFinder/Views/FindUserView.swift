//
//  findUserView.swift
//  GitFinder
//
//  Created by Charles Yamamoto on 2023/12/26.
//

import SwiftUI

struct FindUserView: View {
    var body: some View {
        VStack(spacing: 20){
            Image("FindUser")
                .resizable()
                .scaledToFit()
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .frame(width: 160, height: 160)
            Spacer()
        }.padding()
    }
}

#Preview {
    FindUserView()
}
