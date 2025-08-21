
import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Query private var movies: [Movie]
    
    @State private var isSheetShow: Bool = false
    
    @State private var randomMovie: String = ""
    
    @State private var isShowingAlert: Bool = false
    
    // MARK: - FUNCTIONS
    private func randomMovieGenerator() {
        randomMovie = movies.randomElement()!.title
    }
    
    var body: some View {
        List{
            if !movies.isEmpty {
                Section(
                    header:
                        VStack {
                            Text("WATCHLIST")
                                .font(.largeTitle)
                                .fontWeight(.black)
                                .foregroundStyle(.blue.gradient)
                                .padding()
                            
                            HStack {
                                Label("Title", systemImage: "movieclapper")
                                Spacer()
                                Label("Genre", systemImage: "tag")
                            }
                        }
                    
                ) {
                    ForEach(movies){ movie in
                        HStack {
                            Text(movie.title)
                                .font(.title)
                                .fontWeight(.light)
                                .padding(.vertical, 2)
                            
                            Spacer()
                            
                            Text(movie.genre.name)
                                .font(.footnote)
                                .fontWeight(.medium)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 3)
                                .background(
                                    // A pill-shaped rounded rectangle (circle if width = height)
                                    Capsule()
                                        .stroke(lineWidth: 1)
                                )
                                .foregroundStyle(.tertiary)
                        }
                        .swipeActions {
                            Button (role: .destructive) {
                                withAnimation{
                                    modelContext.delete(movie)
                                }
                            }label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                    }
                }
            }
        }//End list
        .overlay {
            if movies.isEmpty{
                EmptyListView()
            }
        }//End overlay
        //MARK: - SAVE AREA
        .safeAreaInset(edge: .bottom, alignment: .center) {
            HStack {
                if movies.count >= 2 {
                    //Randomize button
                    Button {
                        randomMovieGenerator()
                        isShowingAlert = true
                    }label: {
                        ButtonImageView(symbolName: "arrow.trianglehead.2.clockwise.rotate.90.circle.fill")
                    }
                    .alert(randomMovie, isPresented: $isShowingAlert){
                        Button("Ok", role: .cancel) {}
                    }
                    //Custom label for VoiceOver accessibility
                    .accessibilityLabel("Random Movie")
                    //Triggers haptic feedback when the sheet state changes
                    .sensoryFeedback(.success, trigger: isShowingAlert)
                    
                    Spacer()
                }
                Button {
                    isSheetShow.toggle()
                }label: {
                    ButtonImageView(symbolName: "plus.circle.fill")
                }
                //Custom label for VoiceOver accessibility
                .accessibilityLabel("New Movie")
                //Triggers haptic feedback when the sheet state changes
                .sensoryFeedback(.success , trigger: isSheetShow)
            }
            .padding(.horizontal)
        }//End Save area
        
        //MARK: - SHEET
        .sheet(isPresented: $isSheetShow) {
            NewMovieFormView()
        }
    }
}

#Preview("Sample Data") {
    ContentView()
        .modelContainer(Movie.preview)
}

#Preview("Empty list") {
    ContentView()
        .modelContainer(for: Movie.self, inMemory: true)
}
