//
//  BountyViewController.swift
//  BountyList
//
//  Created by hyeonseok on 2021/10/27.
//

import UIKit

class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let nameList = ["brook", "chopper", "franky", "luffy", "nami", "robin", "sanji", "zoro"]
    let bountyList = [33000000, 50, 44000000, 300000000, 16000000, 80000000, 77000000, 120000000]
    
    //세그웨이를 준비하는 함수 ; UIViewController에 이미 구현되어있는데 상속을 했기때문에 override해야함
    //이때 세그웨이를 사용하면서 필요한 데이터를 알려줘야한다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // DetailViewController 에게 데이터를 준다.
        // UITableViewDelegate의 sender로 부터 몇번째 셀인지 받았고 Any?로 받았기 때문에 index를 int로 다운캐스팅
        if segue.identifier == "showDetail"{
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                vc?.name = nameList[index]
                vc?.bounty = bountyList[index]
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    // UITableViewDataSource
//    //몇개가 필요하니??
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 2
//    }
//
//    //어떻게 표현할거니?
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        //cell = identifier for -> 셀의 위치
//        return cell
//
//}
//
//    //UITableViewDelegate
//    //어떻게 반응할거야??
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("--> \(indexPath.row)")
//    }
    
    
    
    
    
    
    //몇개가 필요하니??
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bountyList.count
    }

    //어떻게 표현할거니?
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
// --> 첫번째 방법
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
    }
        let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
        cell.imgView.image = img
        cell.nameLabel.text = nameList[indexPath.row]
        cell.bountyLabel.text = "\(bountyList[indexPath.row])"
        return cell
    }
//
//// --> 두번째 방법
//        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell {
//            let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
//            cell.imgView.image = img
//            cell.nameLabel.text = nameList[indexPath.row]
//            cell.bountyLabel.text = "\(bountyList[indexPath.row])"
//            return cell
//        } else {
//            return UITableViewCell()
//        }
//    }

    // UITableViewDelegate
    // 어떻게 줄거니
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("--> \(indexPath.row)")
        //연결한 segue웨이를 수행하라는 코드 여러개의 세그웨이가 있을수 있어서 구분자 showDetail사용
        //sender가 prepare함수를 사용할 때 몇번째 셀인지 알려주는 역할을 수행
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class ListCell: UITableViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
}
