//
//  CharacterView.swift
//  TestAppInterview
//
//  Created by Vladyslav Vydovskyi on 10.11.2025.
//
import SwiftUI

struct CharacterRowView: View {
    
    let character: CharacterViewData

    var body: some View {
        HStack(spacing: 12) {
            AsyncImage(url: character.imageURL) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 56, height: 56)
                case .success(let img):
                    img
                        .resizable()
                        .scaledToFill()
                        .frame(width: 56, height: 56)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                case .failure:
                    Image(systemName: "person.fill")
                        .font(.system(size: 24, weight: .semibold))
                        .frame(width: 56, height: 56)
                        .foregroundStyle(.white)
                        .background(.gray.opacity(0.4))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                @unknown default:
                    EmptyView().frame(width: 56, height: 56)
                }
            }

            VStack(alignment: .leading, spacing: 2) {
                Text(character.hero)
                    .font(.headline)
                Text(character.name)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }

            Spacer()

            if character.link != nil {
                Image(systemName: "safari")
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 6)
    }
}
