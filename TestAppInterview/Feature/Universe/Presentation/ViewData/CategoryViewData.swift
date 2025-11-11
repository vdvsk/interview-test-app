//
//  CategoryViewData.swift
//  TestAppInterview
//
//  Created by Vladyslav Vydovskyi on 10.11.2025.
//
import Foundation
import SwiftUI

struct CategoryViewData: Hashable, Identifiable {
    
    let id = UUID()
    let title: String
    let characters: [CharacterViewData]
    
    init(category: Category) {
        self.title = category.title
        self.characters = category.items.map { CharacterViewData(character: $0) }
    }
    
    var image: Image {
        switch title.lowercased() {
        case "heroes":
            return Image(systemName: "shield.fill")
        case "villains":
            return Image(systemName: "flame.fill")
        case "teams":
            return Image(systemName: "person.3.fill")
        default:
            return Image(systemName: "sparkles")
        }
    }
    
    var backgroundGradient: LinearGradient {
        switch title.lowercased() {
        case "heroes":
            return LinearGradient(colors: [.blue, .teal], startPoint: .topLeading, endPoint: .bottomTrailing)
        case "villains":
            return LinearGradient(colors: [.red, .orange], startPoint: .topLeading, endPoint: .bottomTrailing)
        case "teams":
            return LinearGradient(colors: [.purple, .indigo], startPoint: .topLeading, endPoint: .bottomTrailing)
        default:
            return LinearGradient(colors: [.gray, .secondary], startPoint: .topLeading, endPoint: .bottomTrailing)
        }
    }
    
}
