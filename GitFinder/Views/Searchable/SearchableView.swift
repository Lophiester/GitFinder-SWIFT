//
//  SearchableView.swift
//  GitFinder
//
//  Created by Charles Yamamoto on 2023/12/29.
//

import SwiftUI

struct SearchableView: View {
    @State var viewModel = SearchableViewModel()
    var username : String
    
    var body: some View {
       
            List(viewModel.filteredFollowers) { follower in
                HStack(spacing: 20) {
                    AsyncImage(url: URL(string: follower.avatarUrl)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(.circle)
                    } placeholder: {
                        Circle().foregroundStyle(.secondary)
                    }
                    .frame(width: 44, height: 44)
                    
                    Text(follower.login)
                        .font(.title3)
                        .fontWeight(.medium)
                }
            }
            .navigationTitle("Followers").task {
                do{
                    viewModel.followers = try await viewModel.fetchData(from: username)}
                catch DataError.invalidURL {
                    print("Invalid URL")
                } catch DataError.invalidData {
                    print("Invalid Data")
                } catch DataError.invalidResponse {
                    print("Invalid Response")
                    
                } catch {
                    print("Unexpected error: \(error)")
                }
            
        }
        .searchable(text: $viewModel.searchTerm, prompt: "Search Followers")
    }
    }


#Preview {
    NavigationStack{
        SearchableView(username: "")}
}
