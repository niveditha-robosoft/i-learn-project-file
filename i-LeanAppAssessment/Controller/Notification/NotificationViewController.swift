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
    
    var objectOfUserDefaults = UserDefaults()
    var objectOfKeyChain = KeyChain()
    
    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.delegate = self
        tableView.dataSource = self
        didloadChanges()
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


extension NotificationViewController{

    func didloadChanges() {
        
        let call = getToken()
        
        if call != ""{
            
            let loader =   self.loader()

            objectOfNotificationViewMOdel.callApiForNotificationData(tokenToSend: call){ status in
                
                DispatchQueue.main.async {
                    self.stopLoader(loader: loader)
                    if status == true{
                        
                        self.tableView.reloadData()
                        
                    }else{
                        
                        DispatchQueue.main.async {
                            self.alertMessage(message: "There are no recent notifications...")
                        }
                        
                        
                    }
                }

            }
            
        }else{
            
            
        }
        
        
 
    }
 
}


extension NotificationViewController{
    
    func getToken() -> String {
        
        var id = ""
       let userIdIs = objectOfUserDefaults.value(forKey: "userId")
        
        if let idIs = userIdIs as? Int{
            
            id = String(idIs)
            
        }

        guard let receivedTokenData = objectOfKeyChain.loadData(userId: id) else {print("2")
            return ""}

        guard let receivedToken = String(data: receivedTokenData, encoding: .utf8) else {print("3")
            return ""}
        
        
        return receivedToken
    }
    
}
