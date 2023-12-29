//
//  SearchableViewModel.swift
//  GitFinder
//
//  Created by Charles Yamamoto on 2023/12/29.
//

import Foundation
import Observation

@Observable final class SearchableViewModel{
    
    var followers: [Follower] = []
    var searchTerm = ""
    
    var filteredFollowers: [Follower] {
        guard !searchTerm.isEmpty else { return followers }
        return followers.filter { $0.login.localizedCaseInsensitiveContains(searchTerm) }
    }
    
    func fetchData(from username : String) async throws -> [Follower]{
        let endpoint = "https://api.github.com/users/\(username)/followers?per_page=100"
        guard let url = URL(string: endpoint) else {
            throw DataError.invalidURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let res = response as? HTTPURLResponse, res.statusCode == 200  else {
            throw DataError.invalidResponse
        }
        do{
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode([Follower].self, from: data)
            
        }catch{
            throw DataError.invalidData
        }
    }
}

