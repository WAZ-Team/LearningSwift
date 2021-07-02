
import UIKit
import Foundation

// ***** MARK: - Tinh truu tuong *****
//============================================================================
protocol Movie {
    func hello()
}
//============================================================================


// ***** MARK: - Tinh Ke Thua *****
//============================================================================
class xMen: Movie {
    func hello() {
        print("Movie X-Men")
    }
}
class wolverine: Movie {
    func hello() {
        print("Movie wolverine")
    }
}
//============================================================================
// ***** MARK: - Tinh Dong Goi *****
//============================================================================
class Film {
    private var movie = [Movie]()
    func addMovie(movie: Movie) {
        self.movie.append(movie)
    }
    func removeMovie(movie: Movie) {
        self.movie.dropLast()
    }
    func allHello() {
        print("=====AllAnimation Hello=====")
        for i in 0 ..< movie.count {
            movie[i].hello()
        }
    }
}
//============================================================================

// ***** MARK: - Tinh Da Hinh *****
//============================================================================
let Film1 = Film()
var movie1: Movie?
movie1 = xMen()
movie1?.hello()
Film1.addMovie(movie: movie1!)
movie1 = wolverine()
movie1?.hello()
Film1.addMovie(movie: movie1!)
Film1.allHello()
//============================================================================
