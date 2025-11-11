//
//  Category.swift
//  TestAppInterview
//
//  Created by Vladyslav Vydovskyi on 10.11.2025.
//

struct Category: Codable {
    
    let title: String
    let items: [Character]
    
    enum CodingKeys: String, CodingKey { case title, items }
    
    init(title: String, items: [Character]) {
        self.title = title
        self.items = items
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let title = try container.decode(String.self, forKey: .title)
        
        var lossy: [Character] = []
        var arr = try container.nestedUnkeyedContainer(forKey: .items)
        while !arr.isAtEnd {
            do {
                let ch = try arr.decode(Character.self)
                lossy.append(ch)
            } catch {
                _ = try? arr.skipOne()
            }
        }
        
        self.init(title: title, items: lossy)
    }
}

private extension UnkeyedDecodingContainer {
    mutating func skipOne() throws {
        _ = try? decode(EmptyDecodable.self)
    }
}

private struct EmptyDecodable: Decodable {}
