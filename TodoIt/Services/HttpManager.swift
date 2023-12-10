//
//  HttpManager.swift
//  TodoIt
//
//  Created by Jorge Luis Toledo on 12/9/23.
//

import Foundation
import NetworkUtils

//public class HttpManager {
//    public static let shared = HttpManager()
//    private let httpClient: HttpClient
//    
//    private convenience init() {
//        let tokenProvider = LocalTokenProvider()
//        let httpClient = HttpSignedService(tokenProvider: tokenProvider)
//        self.init(httpClient: httpClient)
//    }
//    
//    private init(httpClient: HttpClient) {
//        self.httpClient = httpClient
//    }
//    
//    public func fetch<T: Decodable>(url: URL) async throws -> T {
//        let request = URLRequest(url: url)
//        return try await httpClient.getFromJson(to: request)
//    }
//    
//    public func sendData<T: Encodable>(to url: URL, object: T) async throws -> Data {
//        let request = URLRequest(url: url)
//        let (data, _) = try await httpClient.postAsJson(to: request, object: object)
//        return data
//    }
//     
//    public func put<T: Encodable>(to url: URL, object: T) async throws -> Data {
//        let request = URLRequest(url: url)
//        let (data, _) = try await httpClient.put(to: request, object: object)
//        return data
//    }
//    
//    public func delete(url: URL) async throws {
//        let request = URLRequest(url: url)
//        try await httpClient.delete(to: request)
//    }
//    
//    private func send(request: URLRequest) async throws -> Data {
//        let (data, _) = try await httpClient.perform(from: request)
//        return data
//    }
//}
