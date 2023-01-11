//
//  DetailViewController.swift
//  milestone1
//
//  Created by cali on 11/01/23.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if let imageToLoad = selectedImage {
            title = String(imageToLoad[imageToLoad.startIndex..<imageToLoad.firstIndex(of: "@")!]).uppercased()
            imageView.image = UIImage(named: imageToLoad);
            
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareCountry))
        }
    }
    
    @objc func shareCountry() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            return
        }
        
        let vc = UIActivityViewController(activityItems: [title ?? "Flag", image], applicationActivities: nil)
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
