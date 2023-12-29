//
//  WebKit.swift
//  GitFinder
//
//  Created by Charles Yamamoto on 2023/12/29.
//

import Foundation
import WebKit
import SwiftUI

struct WebKit: UIViewRepresentable {
    
    var urlString: String?
    
    func makeUIView(context: Context) -> some WKWebView {
        WKWebView()
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        guard let safeString = urlString, let url = URL(string: safeString) else {
            return
        }
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
