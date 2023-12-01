//
//  ImageViewModel.swift
//  Movies Show
//
//  Created by Navindas Ghadge on 29/11/23.
//

import SwiftUI
import Combine
import UIKit

class ImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    var cacheSubscription: AnyCancellable?
    init(url: String) {
        guard let validURL = URL(string: url) else {return}
        cacheSubscription = ImageCache
            .image(for: validURL)
            .replaceError(with: nil)
            .receive(on: RunLoop.main, options: .none)
            .assign(to: \.image, on: self)
    }
}
