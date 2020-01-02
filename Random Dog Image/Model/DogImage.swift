import Foundation
import UIKit

struct DogImage: Codable{
    let message: String
    let status: String
}

func requestImage(imageURL: URL, completionHandler: @escaping (UIImage?, Error?) -> Void){
    let task = URLSession.shared.downloadTask(with: imageURL) { (url, response, error) in
        guard let url = url else{
            completionHandler(nil, error)
            return
        }
        do{
            let data = try Data(contentsOf: url)
            let image = UIImage(data: data)
            completionHandler(image, nil)
        }catch{
            print(error)
        }
    }
    task.resume()
}

func requestRandomImage(completionHandler: @escaping (DogImage? , Error?) -> Void){
    
    let url = RandomDogImageAPI.EndPoint.randomImage.url
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let data = data else{
            completionHandler(nil, error)
            return
        }
        
        let decoder = JSONDecoder()
        do{
            let imageData = try decoder.decode(DogImage.self, from: data)
            completionHandler(imageData, nil)
        }
        catch{
            
        }
    }
    task.resume()
}
