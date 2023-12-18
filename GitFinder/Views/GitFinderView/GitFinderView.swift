//
//  ContentView.swift
//  GitFinder
//
//  Created by Charles Yamamoto on 2023/12/15.
//

import SwiftUI

struct GitFinderView: View {
    
    @State var user : UserData?
    
    var body: some View {
        VStack(spacing: 20) {
            AsyncImage(url: URL(string: user?.avatarUrl ?? "")) { image in
                image.resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                
            } placeholder: {
                Circle()
                    .foregroundStyle(.gray)
            }
            .frame(width: 124,height: 124)
            Text(user?.login ?? "Username")
                .font(.title3)
                .bold()
            Text(user?.bio ?? "This is where the github bio will go.")
            Spacer()
        }
        .padding()
        .task {
            do{
                user = try await fetchData(username: "username")
            }catch DataError.InvalidURL{
                print("invalid URL")
            } catch DataError.invalidData{
                print ("invalid Data")
            } catch DataError.invalidResponse {
                print("invalid Response")
            }catch{
                print("unexpected error")
            }
        }
        
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
    GitFinderView()
}

