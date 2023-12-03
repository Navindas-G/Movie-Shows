//
//  MovieListView.swift
//  Movies Show
//
//  Created by Navindas Ghadge on 28/11/23.
//

import SwiftUI

struct MovieListView: View {
    
    @StateObject private var viewModel = MovieListViewModel(datasource: MovieListDataSource())
    
    var body: some View {
        List {
            ForEach(viewModel.moviesListArray, id: \.id, content: { movie in
                ZStack {
                    RemoteImageView(imagePath: movie.backdropPath ?? "", movieName: movie.title ?? "")
                        .frame(maxWidth: .infinity)
                        .clipShape(RoundedRectangle(cornerRadius: 10.0))
                    
                    NavigationLink {
                        MovieDetailsView(movieId: movie.id ?? 0)
                    } label: {EmptyView()}
                        .buttonStyle(PlainButtonStyle())
                        .opacity(0.0)
                        .accessibilityIdentifier("NavigationLink" + String(movie.id ?? 0))
                    
                    VStack {
                        Text((movie.adult ?? false) ? "A" : "U/A")
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundStyle(Color.white)
                            .padding(EdgeInsets(top: 5.0, leading: 5.0, bottom: 5.0, trailing: 5.0))
                            .background(alignment: .topTrailing) {
                                Color.primary.opacity(0.7)
                                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(EdgeInsets(top: 20.0, leading: 0.0, bottom: 0.0, trailing: 10.0))
                        
                        Spacer()
                    }
                }
            })
            .listRowSeparator(.hidden)
            .selectionDisabled()
        }
        .accessibilityIdentifier("movielist")
        .alert("Error", isPresented: $viewModel.shouldShowAlert, actions: {
            Button(action: {
                self.viewModel.shouldShowAlert = false
                self.viewModel.alertMessage = ""
            }, label: {
                Text("OK")
                    .foregroundStyle(Color.cyan)
                    .font(.subheadline)
                    .fontWeight(.bold)
            })
            .accessibilityIdentifier("button_ok")
            
        }, message: {
            Text(self.viewModel.alertMessage)
                .font(.caption)
                .fontWeight(.medium)
        })
        .accessibilityIdentifier("movielist")
        .listStyle(.plain)
        .onLoad {
            self.viewModel.getMovieList(for: Constant.sharedInstance.popularMovieURL)
        }
        .overlay {
            ZStack {
                if self.viewModel.shouldShowLoader {
                    ProgressView {
                        Text("Loading...")
                            .font(.headline)
                            .fontWeight(.semibold)
                        
                    }
                    .progressViewStyle(CircularProgressViewStyle())
                    .frame(width: 100.0, height: 80.0)
                    .background(Color.gray.clipShape(RoundedRectangle(cornerRadius: 10.0)))
                }
                
                if self.viewModel.shouldShowNoDataFound {
                    Text("No Data Found")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color.white)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .ignoresSafeArea()
                        .background(Color.gray)
                        .accessibilityIdentifier("nodatafound")
                }
            }
        }
        .navigationTitle("Movie List")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    NavigationView {
        MovieListView()
    }
    
}
