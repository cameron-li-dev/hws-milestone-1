//
//  ViewController.swift
//  milestone1
//
//  Created by cali on 9/01/23.
//

import UIKit

class ViewController: UITableViewController {
    var flags = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // TODO: Read the assets correctly
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            flags.append(item)
        }
        
        print(flags)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return flags.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Flag", for: indexPath)
        cell.textLabel?.text = flags[indexPath.row]
        return cell
    }
//    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
//        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
//            // 2: success! Set its selectedImage property
//            vc.selectedImage = pictures[indexPath.row]
//            vc.numOfImages = pictures.count;
//            vc.imageIndex = indexPath.row + 1;
//            
//            // 3: now push it onto the navigation controller
//            navigationController?.pushViewController(vc, animated: true)
//        }
//    }
}

