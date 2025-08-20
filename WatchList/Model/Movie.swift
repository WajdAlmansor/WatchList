import SwiftData

@Model
class Movie {
    var title: String
    var genre: Genre
    
    init(title: String, genre: Genre) {
        self.title = title
        self.genre = genre
    }
}

//Dumy data
extension Movie {
    @MainActor
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: Movie.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        container.mainContext.insert(Movie(title: "John Wick", genre: Genre(rawValue: 1)!))
        container.mainContext.insert(Movie(title: "Groundhog day", genre: Genre(rawValue: 2)!))
        container.mainContext.insert(Movie(title: "Toy story", genre: Genre(rawValue: 7)!))
        container.mainContext.insert(Movie(title: "Blade Runner", genre: Genre(rawValue: 9)!))
        container.mainContext.insert(Movie(title: "Lord of the Rings", genre: Genre(rawValue: 6)!))
        container.mainContext.insert(Movie(title: "Zotobia", genre: Genre(rawValue: 2)!))
        container.mainContext.insert(Movie(title: "The Revennt", genre: Genre(rawValue: 5)!))
        container.mainContext.insert(Movie(title: "The Greatest ShowMan", genre: Genre(rawValue: 8)!))
        
        return container
    }
}
