//
//  StudyingViewController.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 10/12/22.
//

import UIKit

class StudyingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var objectOfHomeViewModel = HomeViewModel.objectOfViewModel
    
    var objectOfUserDefaults = UserDefaults()
    var objectOfKeyChain = KeyChain()

    @IBOutlet weak var contFindLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        callApi()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        callApi()

    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectOfHomeViewModel.currentyStudyingData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! StudyingTableViewCell
        
        if objectOfHomeViewModel.currentyStudyingData[indexPath.row].percentahge != 100 {
            
            cell.subjectImage.image = getImage(urlString: objectOfHomeViewModel.currentyStudyingData[indexPath.row].subject_image)
            cell.subjectName.text = objectOfHomeViewModel.currentyStudyingData[indexPath.row].subjectName.uppercased()
            cell.lessonName.text = objectOfHomeViewModel.currentyStudyingData[indexPath.row].chapterName.capitalized
            cell.setCornerRadius()
        }else{
            
            
        }
        
        return cell
        
        
    }
    
    
    func callApi() {
        
        let tokenIs = getToken()

        let loader =   self.loader()

        objectOfHomeViewModel.callApiForCurrentStudyingDetails(tokenToSend: tokenIs){ status in
            DispatchQueue.main.async() {
                self.stopLoader(loader: loader)
            if status == true{
                
                self.tableView.reloadData()
                self.contFindLabel.isHidden = true
            }else{
                
                self.contFindLabel.isHidden = false
                self.tableView.isHidden = true

            }
            
        }
        }
        
    }
}
    
    extension StudyingViewController{
        
        func getToken() -> String {
            
            var id = ""
           let userIdIs = objectOfUserDefaults.value(forKey: "userId")
            
            if let idIs = userIdIs as? Int{
                
                id = String(idIs)
                
            }
            print("stored user id : \(id)")

            
            guard let receivedTokenData = objectOfKeyChain.loadData(userId: id) else {print("2")
                return ""}

            guard let receivedToken = String(data: receivedTokenData, encoding: .utf8) else {print("3")
                return ""}
            
            print("token",receivedToken)
            
            return receivedToken
        }
        
        
        func getImage(urlString: String) -> UIImage {
            
            guard let imageUrl = URL(string: urlString) else { return #imageLiteral(resourceName: "img_geography-1") }
            
            let imageData = try?
            Data(contentsOf: imageUrl)
            
            if let imageData = imageData{
                
                guard let image = UIImage(data: imageData) else { return #imageLiteral(resourceName: "img_geography-1") }
                
                return image
            }
            
            return #imageLiteral(resourceName: "img_geography")
            
        }
        
        
    }
