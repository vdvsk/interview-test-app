//
//  MarvelViewModel.swift
//  TestAppInterview
//
//  Created by Vladyslav Vydovskyi on 10.11.2025.
//
import SwiftUI

@MainActor
final class MarvelViewModel: ObservableObject {
    
    @Published var state: State = .idle

    private let networkService: ServiceProtocol
    
    init(service: ServiceProtocol) {
        self.networkService = service
    }
    
    func loadData() async {
        guard state != .loading else { return }
        state = .loading
        
        do {
            let universe = try await networkService.fetchUniverse()
            state = .loaded(.init(universe: universe))
        } catch {
            state = .error
        }
    }
    
}

extension MarvelViewModel {
    
    enum State: Equatable {
        case idle
        case loading
        case loaded(UniverseViewData)
        case error
    }

}
