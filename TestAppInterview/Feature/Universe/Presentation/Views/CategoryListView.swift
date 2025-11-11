//
//  CategoryListView.swift
//  TestAppInterview
//
//  Created by Vladyslav Vydovskyi on 11.11.2025.
//
import SwiftUI

struct CategoryListView: View {
    
    var categories: [CategoryViewData]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(categories) { category in
                    NavigationLink {
                        CharacterListView(category: category)
                    } label: {
                        CategoryView(viewData: category)
                            .padding(.horizontal)
                    }
                }
            }
            .padding(.vertical, 8)
        }
    }

}

