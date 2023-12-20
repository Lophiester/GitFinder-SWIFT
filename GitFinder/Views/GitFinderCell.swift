//
//  GitFinderCell.swift
//  GitFinder
//
//  Created by Charles Yamamoto on 2023/12/18.
//

import SwiftUI

struct GitFinderCell: View {
    
    @State var userData : UserData?
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
                    Task {
                        do{
                            userData = try await viewModel.fetchData()
                            viewModel.searchText = ""}
                        catch DataError.invalidURL {
                            print("invalid URL")
                        } catch DataError.invalidData {
                            print("invalid Data")
                        } catch DataError.invalidResponse {
                            print("invalid Response")
                        } catch {
                            print("unexpected error")
                        }
                    }
                    
                }
            
            
            AsyncImage(url: URL(string: userData?.avatarUrl ?? "No Image")) { image in
                image.resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                
            } placeholder: {
                Circle()
                    .foregroundStyle(.gray)
            }
            .frame(width: 124,height: 124)
            Text(userData?.login ?? "No Nickname")
                .font(.title3)
                .bold()
            Text(userData?.bio ?? "No bio")
            Spacer()
        }.padding()
    }
}

#Preview {
    GitFinderCell(userData: MockData.sampleUserData)
}
