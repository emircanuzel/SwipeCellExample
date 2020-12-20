//
//  ViewController.swift
//  SwiperCell
//
//  Created by Emircan UZEL on 3.12.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var names : [String] = ["Emircan Uzel" , "Elon Musk" , "Bill Gates" , "Jeff Bezos"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Accounts"
        self.tableView.dataSource = self
        self.tableView.delegate = self
        // Do any additional setup after loading the view.
    }

}
extension ViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! cell
        cell.title.text = "\(indexPath.row)" //self.names[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    @available(iOS 11.0, *)
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let call = UIContextualAction(style: .normal, title: "Call") { action, view, complete in
            print("call")
            complete(true)
        }
        call.image = UIImage(named: "call")
        call.backgroundColor = .green
        let delete = UIContextualAction(style: .destructive, title: "Delete") { action, view, complete in
            print("delete")
            complete(true)
        }
        delete.image = UIImage(named: "delete")
        delete.image?.withTintColor(.white)
        delete.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [delete,call])
    }
}
final class cell : UITableViewCell {
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
