//
//  DetailViewController.swift
//  BountyList
//
//  Created by hyeonseok on 2021/10/28.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func close(_ sender: Any) {
        //dismiss 사라지고나서 후에 동작해야할 것들을 적어줌
        dismiss(animated: true, completion: nil)
    }
    
}
