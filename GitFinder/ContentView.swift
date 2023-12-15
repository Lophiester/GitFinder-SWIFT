//
//  ContentView.swift
//  GitFinder
//
//  Created by Charles Yamamoto on 2023/12/15.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack(spacing: 20) {
            Circle()
                .foregroundStyle(.gray)
                .frame(width: 124,height: 124)
            Text("Username")
                .font(.title3)
                .bold()
            Text("This is where the github bio will go.")
            Spacer()
        }
        .padding()
    }
    
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
#Preview {
    ContentView()
}


struct UserData: Codable{
    let login : String
    let avatarUrl : String
    let bio : String
}

enum DataError: Error {
    case invalidData, invalidResponse,InvalidURL
}
