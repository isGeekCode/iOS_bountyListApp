//
//  DetailViewController.swift
//  BountyList
//
//  Created by hyeonseok on 2021/10/28.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    
    var name: String?
    var bounty: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        if let name = self.name, let bounty = self.bounty {
            let img = UIImage(named: "\(name).jpg")
            imgView.image = img
            nameLabel.text = name
            bountyLabel.text = "\(bounty)"
        }
    }
    
    @IBAction func close(_ sender: Any) {
        //dismiss 사라지고나서 후에 동작해야할 것들을 적어줌
        dismiss(animated: true, completion: nil)
    }
    
}
