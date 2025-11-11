//
//  CharacterListView.swift
//  TestAppInterview
//
//  Created by Vladyslav Vydovskyi on 10.11.2025.
//

import SwiftUI

struct CharacterListView: View {
    
    let category: CategoryViewData
    @Environment(\.openURL) private var openURL
    
    @State private var showAlert = false
    @State private var alertMessage = ""

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(category.characters) { character in
                    CharacterRowView(character: character)
                        .onTapGesture {
                            if let url = character.link {
                                openURL(url)
                            } else {
                                alertMessage = "No link available for \(character.hero)"
                                showAlert = true
                            }
                        }
                        .padding(.horizontal)
                }
            }
            .padding(.vertical, 12)
        }
        .navigationTitle(category.title)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(.systemGroupedBackground))
        .alert("Oops!", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text(alertMessage)
        }
    }

}
