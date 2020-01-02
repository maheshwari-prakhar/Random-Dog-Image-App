import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dogImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestRandomImage(completionHandler: handleRandomImageResponse(data:error:))
    }
    
    func handleImageFileResponse(image: UIImage? , error: Error?){
        guard let image = image else{
            return
        }
        DispatchQueue.main.async {
            self.dogImageView.image = image
        }
    }
    
    func handleRandomImageResponse(data: DogImage?, error: Error?){
        if let imageURL = URL(string: data!.message){
            requestImage(imageURL: imageURL, completionHandler: self.handleImageFileResponse(image:error:))
        }else{
            print(error!.localizedDescription)
        }
    }
}

