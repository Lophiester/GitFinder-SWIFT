//
//  GitFinderViewModel.swift
//  GitFinder
//
//  Created by Charles Yamamoto on 2023/12/18.
//

import Foundation
import Observation

@Observable final class GitFinderViewModel{
    var searchText: String = ""
    var isSearching: Bool = false
    var userData: UserData?
    var followers : [Follower] = []
    var searchTerm = ""
    
    var filteredFollowers: [Follower] {
        guard !searchTerm.isEmpty else { return followers }
        return followers.filter { $0.login.localizedCaseInsensitiveContains(searchTerm) }
    }
    
    func fetchData () async throws -> UserData{
        let endpoint = "https://api.github.com/users/\(searchText)"
        
        guard let url = URL(string: endpoint) else {
            throw DataError.invalidURL
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
    
    func searchUser() {
        Task {
            isSearching = true
            do {
                userData = try await fetchData()
                searchText = ""
            } catch DataError.invalidURL {
                print("Invalid URL")
            } catch DataError.invalidData {
                print("Invalid Data")
            } catch DataError.invalidResponse {
                print("Invalid Response")
                userData = nil // Limpar os dados do usuário se a resposta for inválida
            } catch {
                print("Unexpected error: \(error)")
            }
            
        }
    }
    
    func getFollowers () async throws -> [Follower]{
        let endpoint = "https://api.github.com/users/Lophiester/followers?per_page=100"
        guard let url = URL(string: endpoint) else {
            throw DataError.invalidURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let res = response as? HTTPURLResponse, res.statusCode == 200 else {
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
