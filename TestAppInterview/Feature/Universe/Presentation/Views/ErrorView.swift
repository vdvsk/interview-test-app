//
//  ErrorView.swift
//  TestAppInterview
//
//  Created by Vladyslav Vydovskyi on 11.11.2025.
//
import SwiftUI

struct ErrorView: View {
    
    let retryAction: () -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "exclamationmark.triangle.fill")
                .symbolRenderingMode(.palette)
                .foregroundStyle(.white, .red)
                .font(.system(size: 60))
                .padding()
                .background(
                    Circle()
                        .fill(Color.red.opacity(0.15))
                )
                .padding(.top, 140)
            
            Text("Oops! Something went wrong")
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            
            Text("For some reaseon app can't load data")
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            Spacer()
            
            Button(action: retryAction) {
                Label("Try Again", systemImage: "arrow.clockwise.circle.fill")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(
                        Capsule()
                            .fill(LinearGradient(
                                colors: [.red, .orange],
                                startPoint: .leading,
                                endPoint: .trailing)
                            )
                    )
                    .foregroundStyle(.white)
            }
            .padding(.top, 8)
        }
        .padding(32)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(.systemGroupedBackground))
    }
}
