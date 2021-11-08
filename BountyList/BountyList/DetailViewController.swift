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
    
    //BountyView로부터 받아올 변수 지정 (옵셔널)
    var name: String?
    var bounty: Int?
    
    //ViewController가 뜨기 직전, 메모리에 올라왔을 때 ViewDidLoad가 실행된다. 이때 updateUI가 실행됨
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    //UI컴포넌트들을 업데이트 하는 메서드. 옵셔널바인딩을 사용
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
