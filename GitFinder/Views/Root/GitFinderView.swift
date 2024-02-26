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
        NavigationStack{
            VStack(spacing: 20){
                VStack{
                    HStack{
                        TextField("Search User...", text: $viewModel.searchText)
                            .padding()
                           
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled()
                            .multilineTextAlignment(.leading)
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding()
                    }
                    .background(Color.gray.opacity(0.2))
                    .clipShape(.rect(cornerRadius: 20))
                }
                   Spacer()
                if viewModel.isLoading{
                    LoadingView()
                }
              else if !viewModel.isSearching {
                    FindUserView()
                } else {
                    if let userData = viewModel.userData {
                        // Mostrar detalhes do usuário encontrado
                        UserDetailsView(userData: userData)
                    } else {
                        ContentUnavailableView("Ohhhh",
                                               systemImage: "person.fill.questionmark", description: Text("User with: \(viewModel.searchText) not found"))
                    }
                    
                }
               Spacer()
            }.padding()
            
        
        }
        .onSubmit  {
            viewModel.searchUser()
        }
       
    }
 
}


#Preview {
    GitFinderView()
}

