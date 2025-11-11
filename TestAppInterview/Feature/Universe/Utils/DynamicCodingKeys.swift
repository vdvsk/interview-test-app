//
//  DynamicCodingKeys.swift
//  TestAppInterview
//
//  Created by Vladyslav Vydovskyi on 10.11.2025.
//

struct DynamicCodingKey: CodingKey {
    
    var stringValue: String
    var intValue: Int? { nil }
    init(_ string: String) { self.stringValue = string }
    init?(stringValue: String) { self.stringValue = stringValue }
    init?(intValue: Int) { return nil }
    
}
