//
//  NewMovieFormView.swift
//  WatchList
//
//  Created by Wajd on 20/08/2025.
//

import SwiftUI

struct NewMovieFormView: View {
    @Environment(\.modelContext) var modelContext
    
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String = ""
    
    @State private var selectedGenre: Genre = .kids
    
    private func addMovie() {
        let newMovie = Movie(title: title, genre: selectedGenre)
        modelContext.insert(newMovie)
        title = ""
        selectedGenre = .kids
    }
    
    var body: some View {
        Form {
            List {
            // MARK: - HEADER
                Text("What to Watch")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundStyle(.blue.gradient)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    .padding(.vertical)
                
            // MARK: - TITLE
                TextField("Movie title", text: $title )
                    .textFieldStyle(.roundedBorder)
                    .font(.largeTitle)
                    .fontWeight(.light)
                
            // MARK: -  GENRE
                Picker("Genre", selection: $selectedGenre) {
                    ForEach(Genre.allCases) { genre in
                        Text(genre.name)
                            .tag(genre)
                    }
                }
            // MARK: - SAVE BUTTON
                Button {
                        addMovie()
                        dismiss()
                    
                }label: {
                    Text("Save")
                        .font(.title2)
                        .fontWeight(.medium)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.extraLarge)
                .buttonBorderShape(.roundedRectangle)
                .disabled(title.isEmpty || title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                
            // MARK: - CANCEL BUTTON
                Button {
                    dismiss()
                }label: {
                    Text("Close")
                        .frame(maxWidth: .infinity)
                }
                .padding(.vertical)
                
            }//End list
            .listRowSeparator(.hidden)
        }//End form
    }
}

#Preview {
    NewMovieFormView()
}
