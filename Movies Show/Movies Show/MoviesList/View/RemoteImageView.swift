//
//  RemoteImageView.swift
//  Movies Show
//
//  Created by Navindas Ghadge on 29/11/23.
//

import SwiftUI

struct RemoteImageView: View {
    @ObservedObject var imageModel: ImageViewModel
    var movieName: String!
    
    init(imagePath: String, movieName: String) {
        let imageURLString = Constant.sharedInstance.imageURL + imagePath
        imageModel = ImageViewModel(url: imageURLString)
        self.movieName = movieName
    }
    
    var body: some View {
        (imageModel
            .image
            .map { Image(uiImage:$0).resizable().aspectRatio(contentMode: .fit) }
        ?? Image(systemName: "photo").resizable()
            .aspectRatio(contentMode: .fit))
        .overlay {
            ZStack {
                VStack {
                    Spacer()
                    movieNameView
                }
            }
        }
    }
    
    var movieNameView: some View {
        Text(self.movieName)
            .foregroundStyle(Color.white)
            .font(.title2)
            .fontWeight(.bold)
            .padding(EdgeInsets(top: 5.0, leading: 10.0, bottom: 5.0, trailing: 10.0))
            .background(alignment: .bottomLeading) {
                Color.primary.opacity(0.7)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(EdgeInsets(top: 0.0, leading: 5.0, bottom: 10.0, trailing: 0.0))
    }
}

#Preview {
    RemoteImageView(imagePath: "https://image.tmdb.org/t/p/w200/tmU7GeKVybMWFButWEGl2M4GeiP.jpg", movieName: "The Godfather")
}
