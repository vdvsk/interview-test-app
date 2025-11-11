//
//  NetworkService.swift
//  TestAppInterview
//
//  Created by Vladyslav Vydovskyi on 10.11.2025.
//
import Foundation

final class NetworkService: ServiceProtocol {
    
    private let session: URLSession
    private let decoder: JSONDecoder
    
    public init(
        session: URLSession = .shared,
        decoder: JSONDecoder = JSONDecoder(),
    ) {
        self.session = session
        self.decoder = decoder
    }
    
    func fetchUniverse() async throws -> Universe {
        var request = URLRequest(url: Endpoint.universe.url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue(Secrets.jsonbinAccessKey, forHTTPHeaderField: "X-Access-Key")
        
        do {
            let (data, _) = try await session.data(for: request)
            let model = try decoder.decode(Payload.self, from: data)
            return model.record
        } catch  {
            throw MarvelServiceError.somethingWentWrong
        }
    }
    
}

public enum MarvelServiceError: Error {
    case somethingWentWrong
}
