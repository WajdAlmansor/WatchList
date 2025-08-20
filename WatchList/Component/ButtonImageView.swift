//
//  ButtonImageView.swift
//  WatchList
//
//  Created by Wajd on 20/08/2025.
//

import SwiftUI

struct ButtonImageView: View {
    let symbolName: String
    var body: some View {
        Image(systemName: symbolName)
            .resizable()
            .scaledToFit()
            .foregroundStyle(.blue.gradient)
            .padding(8)
            .background(
                Circle()
                    .fill(.ultraThickMaterial)
            )
            .frame(width: 80)
    }
}

#Preview {
    ButtonImageView(symbolName: "plus.circle.fill")
}
