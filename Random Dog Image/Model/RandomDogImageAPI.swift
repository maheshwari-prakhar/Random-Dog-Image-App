import Foundation


class RandomDogImageAPI{
    enum EndPoint: String{
        case randomImage = "https://dog.ceo/api/breeds/image/random"
    
    var url: URL {
        return URL(string: self.rawValue)!
    }
        
    }
}
