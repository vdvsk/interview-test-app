//
//  CharacterApiModel.swift
//  TestAppInterview
//
//  Created by Vladyslav Vydovskyi on 10.11.2025.
//
import Foundation

struct Character: Codable {
    
    let hero: String
    let name: String
    let link: URL?
    let img: URL?
    
    enum CodingKeys: String, CodingKey {
        case hero
        case name
        case link
        case img
    }
    
    init(hero: String, name: String, link: URL?, img: URL?) {
        self.hero = hero
        self.name = name
        self.link = link
        self.img = img
    }
    
    init(from decoder: Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        
        let hero = try c.decode(String.self, forKey: .hero)
        
        var name = try c.decodeIfPresent(String.self, forKey: .name)
        if name == nil {
            let dyn = try decoder.container(keyedBy: DynamicCodingKey.self)
            name = try dyn.decodeIfPresent(String.self, forKey: .init("nam"))
        }
        
        var linkStr = try c.decodeIfPresent(String.self, forKey: .link)
        if linkStr == nil {
            let dyn = try decoder.container(keyedBy: DynamicCodingKey.self)
            linkStr = try dyn.decodeIfPresent(String.self, forKey: .init("links"))
        }
        let link = linkStr.flatMap(URL.init(string:))
        
        var imgStr = try c.decodeIfPresent(String.self, forKey: .img)
        if imgStr == nil {
            let dyn = try decoder.container(keyedBy: DynamicCodingKey.self)
            imgStr = try dyn.decodeIfPresent(String.self, forKey: .init("image"))
        }
        let img = imgStr.flatMap(URL.init(string:))
        
        self.init(hero: hero, name: name ?? "Unknown", link: link, img: img)
    }
}
