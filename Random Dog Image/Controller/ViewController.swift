//
//  ViewController.swift
//  Random Dog Image
//
//  Created by Prakhar Maheshwari on 1/1/20.
//  Copyright © 2020 Prakhar Maheshwari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dogImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestRandomImage(completionHandler: handleRandomImageResponse(data:error:))
    }
    
    func handleImageFileResponse(image: UIImage? , error: Error?){
        DispatchQueue.main.async {
            self.dogImageView.image = image
        }
    }
    
    func handleRandomImageResponse(data: DogImage?, error: Error?){
        if let imageURL = URL(string: data!.message){
            requestImage(imageURL: imageURL, completionHandler: self.handleImageFileResponse(image:error:))
        }
    }
}

