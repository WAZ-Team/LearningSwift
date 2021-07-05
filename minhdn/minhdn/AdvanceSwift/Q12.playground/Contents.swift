//What is typecasting ? When is type casting useful in Swift

import UIKit

var str = "Hello, playground"
print("typecasting là một cách để kiểm tra kiểu của một thể hiện hoặc để coi thể hiện đó như một lớp cha hoặc lớp con khác với một nơi khác trong hệ thống phân cấp lớp của chính nó.")
print("typecasting được thực hiện với toán tử is và as. Hai toán tử này cung cấp một cách đơn giản và dễ hiểu để kiểm tra kiểu của một giá trị hoặc chuyển một giá trị sang một kiểu khác.")
/*-----Demo typecasting-----*/
class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}
class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}
let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]
// su dung typecasting voi iss
var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    } else if item is Song {
        songCount += 1
    }
}

print("Media library contains \(movieCount) movies and \(songCount) songs")
// su dung typecasting voi as
for item in library {
    if let movie = item as? Movie {
        print("Movie: \(movie.name), dir. \(movie.director)")
    } else if let song = item as? Song {
        print("Song: \(song.name), by \(song.artist)")
    }
}
