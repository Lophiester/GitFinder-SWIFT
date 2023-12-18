//
//  ContentView.swift
//  GitFinder
//
//  Created by Charles Yamamoto on 2023/12/15.
//

import SwiftUI

struct GitFinderView: View {
    
    
    var viewModel = GitFinderViewModel()
    @State var user : UserData
    @State var username = "Lophiester"
    
    var body: some View {
            GitFinderCell(userData: user)
        .task {
            do{
                user = try await viewModel.fetchData(username: username)
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
  
}
#Preview {
    GitFinderView(user: MockData.sampleUserData)
}

