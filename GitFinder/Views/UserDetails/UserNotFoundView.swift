//
//  NotFindView.swift
//  GitFinder
//
//  Created by Charles Yamamoto on 2023/12/25.
//

import SwiftUI

struct UserNotFoundView: View {
    
    
    var body: some View {
            VStack{
                Text("User Not Found")
                    .font(.largeTitle)
                            .foregroundColor(.black)
                            .shadow(radius: 5, y: 5)
                            .padding(.bottom, 20)
                Image("UserNotFound")
                    .resizable()
                    .scaledToFit()
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .frame(width: 160, height: 160)
        }
    }
}

#Preview {
    UserNotFoundView()
}
