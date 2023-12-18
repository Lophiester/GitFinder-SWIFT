//
//  GitFinderViewModel.swift
//  GitFinder
//
//  Created by Charles Yamamoto on 2023/12/18.
//

import Foundation
import Observation

@Observable final class GitFinderViewModel{
    

    func fetchData (username: String) async throws -> UserData{
        let endpoint = "https://api.github.com/users/\(username)"
  
        guard let url = URL(string: endpoint) else {
            throw DataError.InvalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let res = response as? HTTPURLResponse, res.statusCode == 200 else {
            throw DataError.invalidResponse
        }
        do{
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try  decoder.decode(UserData.self, from: data)
        }catch{
            throw DataError.invalidData
        }
        
    }
}
