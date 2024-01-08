//
//  LoadingView.swift
//  GitFinder
//
//  Created by Charles Yamamoto on 2024/01/08.
//
import SwiftUI

struct LoadingView: View {

    
    var body: some View {
        ZStack {
            // Outros elementos da sua interface
            // ...
            
            
            // Uma view de fundo translúcida para cobrir a tela
            Color.white
                .ignoresSafeArea(edges: .all)
            
            // Uma roda de atividade para indicar o carregamento
            ProgressView()
                .progressViewStyle(.circular)
                .scaleEffect(3.0, anchor: .center)
        }
    }
}

#Preview {
    LoadingView()
}
