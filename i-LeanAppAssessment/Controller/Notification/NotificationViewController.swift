//
//  ViewController.swift
//  notification
//
//  Created by Shrushti Shetty on 07/12/22.
//

import UIKit

class NotificationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var objectOfNotificationViewMOdel = NotificationViewMOdel.objectOfViewModel
    var objectOfSignInViewModel = SignInViewModel.objectOfViewModel
    
    
    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.delegate = self
        tableView.dataSource = self
        
        objectOfNotificationViewMOdel.callApiForNotificationData(tokenToSend: objectOfSignInViewModel.userDetails[0].token){ status in
            
            if status == true{
                
                self.tableView.reloadData()
                
            }else{
                
                
            }
            
            
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectOfNotificationViewMOdel.notificationDataToShow.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! NotificationsTableViewCell
        cell.customizeView()
        cell.notificationTitle.text = objectOfNotificationViewMOdel.notificationDataToShow.last?.title
        cell.notificationBody.text = objectOfNotificationViewMOdel.notificationDataToShow.last?.message
        return cell
    }

    @IBAction func beckbuttonTohomeScreen(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

