//
//  MarvelView.swift
//  TestAppInterview
//
//  Created by Vladyslav Vydovskyi on 10.11.2025.
//
import SwiftUI

struct MarvelListView: View {
    
    @StateObject var viewModel: MarvelViewModel
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .center) {
                switch viewModel.state {
                case .idle:
                    EmptyView()
                case .loading:
                    ProgressView()
                case .loaded(let universe):
                    CategoryListView(categories: universe.categories)
                        .navigationTitle("\(universe.title)'s universe")
                case .error:
                    ErrorView() {
                        Task {
                            await viewModel.loadData()
                        }
                    }
                }
            }
        }
        .task { await viewModel.loadData() }
    }
    
}
