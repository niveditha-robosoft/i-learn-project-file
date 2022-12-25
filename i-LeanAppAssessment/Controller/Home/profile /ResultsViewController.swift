//
//  ResultsViewController.swift
//  ForgotPassword
//
//  Created by Shrushti Shetty on 08/12/22.
//

import UIKit

class ResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var objectOfProfileViewMOdel = ProfileViewMOdel.objectOfViewMOdel
    var objectOfSignInViewModel = SignInViewModel.objectOfViewModel

    var objectOfUserDefaults = UserDefaults()
    var objectOfKeyChain = KeyChain()
    
    @IBOutlet weak var subjectsDropDown: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.subjectsDropDown.layer.cornerRadius = 5
        self.subjectsDropDown.layer.borderWidth = 2
        self.subjectsDropDown.layer.borderColor =  UIColor(red: 76/255, green: 147/255, blue: 255/255, alpha: 1.0).cgColor
        tableView.delegate = self
        tableView.dataSource = self
  
    }
    
    
    func callApi() {

        let call = getToken()
        
        if call != ""{
            
            let loader =   self.loader()
            objectOfProfileViewMOdel.getResultDetails(tokenToSend: call){ stsus in
                
                DispatchQueue.main.async() {
                    self.stopLoader(loader: loader)
                if stsus == true{
                    
                    self.tableView.reloadData()
                    
                }
                else{
                    self.alertMessage(message: "No result is available...!")
                    
                }
                }
                
            }
            
        }else{
            
            
        }
  
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectOfProfileViewMOdel.resultData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ResultsTableViewCell
        cell.customizeView()
        cell.subjectName.text = objectOfProfileViewMOdel.resultData[indexPath.row].subjectName.uppercased()
        cell.lessonName.text = objectOfProfileViewMOdel.resultData[indexPath.row].lessonName
        cell.lessonNumber.text = objectOfProfileViewMOdel.resultData[indexPath.row].lessonNumber
        cell.numberOfQuestionAttempted.text = String(objectOfProfileViewMOdel.resultData[indexPath.row].questionsAttempted)
        cell.numberOfRightAnswers.text = String(objectOfProfileViewMOdel.resultData[indexPath.row].rightAnswreCount)
        cell.totalNumberOfQuestions.text = "of \(objectOfProfileViewMOdel.resultData[indexPath.row].totalQuestions)"
        cell.percentage.text = String(objectOfProfileViewMOdel.resultData[indexPath.row].totalPercentage)
        return cell
    }

    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
   
    }
    
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
