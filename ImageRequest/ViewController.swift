//
//  ViewController.swift
//  ImageRequest
//
//  Created by Deborah Padilla on 01/31/17.
//  Copyright © 2015 Udacity. All rights reserved.
//

import UIKit

// MARK: - ViewController: UIViewController

class ViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageURL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/4/4d/Cat_November_2010-1a.jpg")!
        
        let task = URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            print("task finished")
            
            if error == nil {
                let downloadImage = UIImage(data: data!)
                
                performUIUpdatesOnMain {
                    self.imageView.image = downloadImage
                }
                
            }
        }
        
        task.resume()
}
    
}
