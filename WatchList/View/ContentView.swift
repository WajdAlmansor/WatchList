
import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query private var movies: [Movie]
    @State private var isSheetShow: Bool = false
    
    var body: some View {
        List{
            
        }//End list
        .overlay {
            if movies.isEmpty{
                EmptyListView()
            }
        }//End overlay
        //MARK: - SAVE AREA
        .safeAreaInset(edge: .bottom, alignment: .center) {
            Button {
                isSheetShow.toggle()
            }label: {
                ButtonImageView(symbolName: "plus.circle.fill")
            }
        }//End Save area
        
        //MARK: - SHEET
        .sheet(isPresented: $isSheetShow) {
            NewMovieFormView()
        }
    }
}

#Preview("Empty list") {
    ContentView()
        .modelContainer(for: Movie.self, inMemory: true)
}
