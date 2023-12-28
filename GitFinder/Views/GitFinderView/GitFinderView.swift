//
//  ContentView.swift
//  GitFinder
//
//  Created by Charles Yamamoto on 2023/12/15.
//

import SwiftUI

struct GitFinderView: View {
    
   
    @State var viewModel = GitFinderViewModel()
   
    
    var body: some View {
        
     
            VStack(spacing: 20){
              
                TextField("Search User...", text: $viewModel.searchText)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .clipShape(.rect(cornerRadius: 20))
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .multilineTextAlignment(.leading)
                    .onSubmit {
                        viewModel.searchUser()
                    }
                if !viewModel.isSearching {
                                FindUserView()
                            } else {
                                if let userData = viewModel.userData {
                                    // Mostrar detalhes do usuário encontrado
                                    UserDetailsView(userData: userData)
                                } else {
                                    UserNotFoundView()
                                }
                            }
                        }
                        .padding()
                    }
                }


#Preview {
    GitFinderView()
}

