//
//  Endpoint.swift
//  TestAppInterview
//
//  Created by Vladyslav Vydovskyi on 11.11.2025.
//
import Foundation

enum Endpoint {
    
    static let base = URL(string: "https://api.jsonbin.io")!
    case universe
    
    var url: URL {
        switch self {
        case .universe:
            var comps = URLComponents(url: Self.base, resolvingAgainstBaseURL: true)!
            comps.path = "/v3/b/66163fe6ad19ca34f857b83a"
            return comps.url!
        }
    }
    
}
