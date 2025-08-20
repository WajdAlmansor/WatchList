//
//  PageTabView.swift
//  WatchList
//
//  Created by Wajd on 20/08/2025.
//

import SwiftUI

struct PageTabView: View {
    var icon: String
    var description: String
    
    var body: some View {
        VStack(spacing: 8){
            Image(systemName: icon)
                .imageScale(.large)
                .font(.largeTitle)
                .fontWeight(.light)
                .symbolEffect(.breathe)
            
            Text(description)
                .font(.title)
                .fontWeight(.light)
                .fontWidth(.compressed)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    PageTabView(icon: "1.circle", description: "Add some movies")
        .padding()
}
