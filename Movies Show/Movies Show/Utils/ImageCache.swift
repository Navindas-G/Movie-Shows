//
//  ImageCache.swift
//  Movies Show
//
//  Created by Navindas Ghadge on 29/11/23.
//

import Foundation
import Combine
import SwiftUI

class ImageCache {
    
    enum Error: Swift.Error {
        case dataConversionFailed
        case sessionError(Swift.Error)
    }
    
    private var publisher : AnyPublisher<UIImage?, ImageCache.Error>!
    static let shared = ImageCache()
    private let cache = NSCache<NSURL, UIImage>()
    private init() { }
    
    static func image(for url: URL) -> AnyPublisher<UIImage?, ImageCache.Error> {
        guard let image = shared.cache.object(forKey: url as NSURL) else {
            return URLSession
                .shared
                .dataTaskPublisher(for: url)
                .tryMap { (tuple) -> UIImage in
                    let (data, _) = tuple
                    guard let image = UIImage(data: data) else {
                        throw Error.dataConversionFailed
                    }
                    shared.cache.setObject(image, forKey: url as NSURL)
                    return image
                }
                .mapError({ error in Error.sessionError(error) })
                .eraseToAnyPublisher()
        }
        
        return Just(image)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
