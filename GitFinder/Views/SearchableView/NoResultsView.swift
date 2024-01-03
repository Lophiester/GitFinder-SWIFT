//
//  NoResultsView.swift
//  GitFinder
//
//  Created by Charles Yamamoto on 2024/01/03.
//

import SwiftUI

struct NoResultsView: View {
    var body: some View {
        VStack(spacing: 20){
            Image(systemName: "magnifyingglass")
                .font(.system(size: 50))
                .foregroundStyle(.gray)
            Text("No Results").font(.title2)
                .bold()
    
            Text("Check the spelling or try a new search").font(.subheadline)
                .foregroundStyle(.gray)
        }
    }
}

#Preview {
    NoResultsView()
}
