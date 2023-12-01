//
//  ClientNetworkServices.swift
//  Movies Show
//
//  Created by Navindas Ghadge on 28/11/23.
//

import Foundation
import Combine

enum NetworkError: String, Error {
    case invalidURL = "Invalid URL"
    case timeOut = "Network Timeout!!! Please check your internet connection"
    case noDataFound = "No Data Found!!! Please check your internet connection"
    case noNetwork = "Your are offline!!! Please check your internet connection"
}

final class ClientNetworkServices: NSObject {
    static let sharedInstance = ClientNetworkServices()
    private override init() {}
    func getData(for urlString: String) async throws -> Data? {
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        if NetworkMonitor.shared.isConnected {
            do {
                guard let validURLRequest = try ClientNetworkServices.getURLRequest(for: urlString) else { throw NetworkError.invalidURL }
                guard let (data,response) = try? await session.data(for: validURLRequest) else {throw NetworkError.noDataFound}
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw NetworkError.noDataFound }
                return data
            } catch let caughtError {
                throw caughtError
            }
        } else {
            throw NetworkError.noNetwork
        }
    }
}

extension ClientNetworkServices {
    static func getURLRequest(for urlString: String) throws -> URLRequest? {
        guard let validURL = URL(string: urlString) else { throw NetworkError.invalidURL }
        
        let headerFields = [
            "Content-Type" : "application/json",
            "Authorization" : "Bearer \(Constant.sharedInstance.apiToken)"
        ]
        
        var urlRequest = URLRequest(url: validURL)
        urlRequest.httpMethod = "GET"
        urlRequest.timeoutInterval = 25
        urlRequest.allHTTPHeaderFields = headerFields
        return urlRequest
    }
}

extension ClientNetworkServices: URLSessionDelegate {
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: (URLSession.AuthChallengeDisposition, URLCredential?) -> Void) {
        if challenge.protectionSpace.serverTrust != nil {
            completionHandler(.useCredential, URLCredential(trust: challenge.protectionSpace.serverTrust!))
        } else {
            completionHandler(.useCredential, nil)
        }
    }
}
