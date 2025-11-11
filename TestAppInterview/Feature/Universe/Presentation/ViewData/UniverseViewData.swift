//
//  UniverseViewData.swift
//  TestAppInterview
//
//  Created by Vladyslav Vydovskyi on 10.11.2025.
//

struct UniverseViewData: Hashable {
    
    let title: String
    let categories: [CategoryViewData]
    
    init(universe: Universe) {
        self.title = universe.title
        self.categories = universe.items.map { CategoryViewData(category: $0) }
    }
    
}
