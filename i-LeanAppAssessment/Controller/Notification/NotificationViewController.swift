//
//  ViewController.swift
//  notification
//
//  Created by Shrushti Shetty on 07/12/22.
//

import UIKit

class NotificationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var title1 = ["xyz", "abc", "bhff", "hhfh", "gfewj", "gfewse"]
        var body = ["Lorem Ipsum is simply dummy text of the printi and typesetting industry.;ekke;k", "Lorem Ipsum is simply dummy text of the printi and typesetting industry.", "Lorem Ipsum is simply dummy text of the printi and typesetting industry.", "jhkhhfddfghyhujjj", "jjhuatyrfgvv", "jkjjdhhbdnjklklll"]
    
    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.delegate = self
        tableView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return title1.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! NotificationsTableViewCell
        cell.customizeView()
        cell.notificationTitle.text = title1[indexPath.row]
        cell.notificationBody.text = body[indexPath.row]
        return cell
    }

    @IBAction func beckbuttonTohomeScreen(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

