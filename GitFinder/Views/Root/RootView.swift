//
//  RootView.swift
//  GitFinder
//
//  Created by Charles Yamamoto on 2024/02/26.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        VStack{
            Image("FindUser")
                .resizable()
                .scaledToFit()
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                .frame(width: 160, height: 160)
        }
    }
}

#Preview {
    RootView()
}
