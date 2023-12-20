//
//  ContentView.swift
//  GitFinder
//
//  Created by Charles Yamamoto on 2023/12/15.
//

import SwiftUI

struct GitFinderView: View {
    
    var user : UserData
    
    var body: some View {
        GitFinderCell(userData: user)
    }
    
}

#Preview {
    GitFinderView(user: MockData.sampleUserData)
}

