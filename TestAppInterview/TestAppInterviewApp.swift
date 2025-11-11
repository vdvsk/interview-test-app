//
//  TestAppInterviewApp.swift
//  TestAppInterview
//
//  Created by Vladyslav Vydovskyi on 10.11.2025.
//

import SwiftUI

@main
struct TestAppInterviewApp: App {
    var body: some Scene {
        WindowGroup {
           UniverseView(viewModel: UniverseViewModel(service: NetworkService()))
        }
    }
}
