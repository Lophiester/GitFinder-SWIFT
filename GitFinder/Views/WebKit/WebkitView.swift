//
//  WebkitView.swift
//  GitFinder
//
//  Created by Charles Yamamoto on 2023/12/29.
//

import SwiftUI

struct WebkitView: View {
    var urlString: String
    
    var body: some View {
     WebKit(urlString: urlString)
    }
}

#Preview {
    WebkitView(urlString: "https://www.google.com")
}
