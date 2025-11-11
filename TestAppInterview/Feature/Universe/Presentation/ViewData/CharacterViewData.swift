//
//  CharacterViewData.swift
//  TestAppInterview
//
//  Created by Vladyslav Vydovskyi on 10.11.2025.
//
import Foundation

struct CharacterViewData: Hashable, Identifiable {
    
    let id = UUID()
    let hero: String
    let name: String
    let link: URL?
    let imageURL: URL?
    
    init(character: Character) {
        self.hero = character.hero
        self.name = character.name
        self.link = character.link
        self.imageURL = character.img
    }

}
