//
//  MovieDetailsView.swift
//  Movies Show
//
//  Created by Navindas Ghadge on 30/11/23.
//

import SwiftUI

struct MovieDetailsView: View {
    @Environment(\.dismiss) var dismissView
    @EnvironmentObject var networkMonitor: NetworkMonitor
    @StateObject var viewModel = MovieDetailsViewModel(datasource: MovieDetailsDatasource())
    
    var movieId: Int!
    
    init(movieId: Int) {
        self.movieId = movieId
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack(alignment: .leading) {
                    RemoteImageView(imagePath: viewModel.movieDetailModel?.posterPath ?? "", movieName: "")
                        .shadow(color: .gray, radius: 20.0, x: 0.0, y: 3.0)
                    
                    Divider()
                    
                    titleSectionView
                    
                    Divider()
                    
                    overViewSection
                    
                    Divider()
                    
                    genreSection
                    
                    Divider()
                    
                    productionCompaniesView
                    
                }
            }
            .ignoresSafeArea()
            .contentMargins(.bottom, 60.0, for: .scrollContent)
            
            if self.viewModel.shouldShowNoDataFound {
                Text("No Data Found")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                    .background(Color.gray)
            }
            
            backButtonView
                .accessibilityIdentifier("moviedetailbackbutton")
            
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
        }
        .alert("Error", isPresented: $viewModel.shouldShowAlert, actions: {
            Button {
                self.viewModel.shouldShowAlert.toggle()
            } label: {
                Text("OK")
                    .foregroundStyle(Color.cyan)
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
        }, message: {
            Text(self.viewModel.alertMessage)
                .font(.caption)
                .fontWeight(.medium)
        })
        .alert("Error", isPresented: $networkMonitor.isConnected, actions: {
            Button {
                self.viewModel.shouldShowAlert.toggle()
            } label: {
                Text("OK")
                    .foregroundStyle(Color.cyan)
                    .font(.subheadline)
                    .fontWeight(.bold)
            }
        }, message: {
            Text(NetworkError.noNetwork.rawValue)
                .font(.caption)
                .fontWeight(.medium)
        })
        .navigationTitle("")
        .toolbar(.hidden, for: .navigationBar)
        .onAppear {
            self.viewModel.fetchMovieDetails(for: self.movieId)
        }
    }
    
    var titleSectionView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Name:" + (viewModel.movieDetailModel?.originalTitle ?? ""))
                    .font(.headline)
                
                Text("Status: \(viewModel.movieDetailModel?.status ?? "")")
                    .font(.subheadline)
            }
            
            Spacer()
            VStack(alignment: .trailing, content: {
                Text("Released Date")
                    .font(.footnote)
                Text(viewModel.movieDetailModel?.releaseDate ?? "")
                    .font(.footnote)
            })
            .foregroundStyle(Color.gray)
            .padding(EdgeInsets(top: 0.0, leading: 0.0, bottom: 0.0, trailing: 5))
        }
        .padding(EdgeInsets(top: 0.0, leading: 5.0, bottom: 0.0, trailing: 5.0))
    }
    
    var backButtonView: some View {
        VStack(alignment: .leading, spacing:5) {
            Button(action: {
                dismissView.callAsFunction()
            }, label: {
                Image(systemName: "arrow.left.circle")
                    .font(.largeTitle)
                    .foregroundStyle(Color.accentColor)
            })
            .frame(width: 50.0, height: 50.0)
            .padding(.horizontal)
            .background(Color.primary.clipShape(Circle()))
            Spacer()
        }
        .frame(maxWidth: .infinity,alignment: .topLeading)
    }
    
    var overViewSection: some View {
        VStack(alignment: .leading) {
            Text("Overview")
                .font(.title)
                .fontWeight(.bold)
            
            Text(viewModel.movieDetailModel?.overview ?? "")
        }
        .padding(EdgeInsets(top: 0.0, leading: 5.0, bottom: 0.0, trailing: 5.0))
    }
    
    var genreSection: some View {
        VStack(alignment: .leading,spacing: 5) {
            Text("Genre")
                .font(.title)
                .fontWeight(.bold)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(viewModel.movieDetailModel?.genres ?? [], id: \.id) { genre in
                        Text(genre.name ?? "")
                            .foregroundStyle(Color.white)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(EdgeInsets(top: 5.0, leading: 10.0, bottom: 5.0, trailing: 10.0))
                            .background {
                                Color.primary.opacity(0.7)
                                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                            }
                    }
                }
            }
        }
        .padding(EdgeInsets(top: 0.0, leading: 5.0, bottom: 0.0, trailing: 5.0))
    }
    
    var productionCompaniesView: some View {
        VStack(alignment: .leading,spacing: 5) {
            Text("Companies")
                .font(.title)
                .fontWeight(.bold)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(self.viewModel.movieDetailModel?.productionCompanies ?? [], id: \.id) { company in
                        Text(company.name ?? "")
                            .foregroundStyle(Color.white)
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(EdgeInsets(top: 5.0, leading: 10.0, bottom: 5.0, trailing: 10.0))
                            .background {
                                Color.primary.opacity(0.7)
                                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
                            }
                    }
                }
            }
        }
        .padding(EdgeInsets(top: 0.0, leading: 5.0, bottom: 0.0, trailing: 5.0))
    }
}

#Preview {
    NavigationView {
        MovieDetailsView(movieId: 609681)
    }
}
