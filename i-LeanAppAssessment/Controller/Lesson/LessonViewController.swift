//
//  LessonViewController.swift
//  i-LeanAppAssessment
//
//  Created by Niveditha Naik on 12/12/22.
//

import UIKit
protocol dismissVc {
    
    func dismiss()
    
    }


class LessonViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var objectOfUserDefaults = UserDefaults()
    var objectOfKeyChain = KeyChain()
    
    var ObjectOfSignInVIewMOdel = SignInViewModel.objectOfViewModel
    
//    var objectOfLessonViewModel = LessonViewModel.objectOfviewModel
    
    var objectOfAboutSUbjectViewModel = AboutSUbjectViewModel()
    var unitDetailsIS = [UnitModel]()
    var objectOfSubjectListViewController = SubjectListViewModel.objectOfViewModel
    var objectOfLessonViewModel = LessonViewModel()
    var lessonDetails = [Lesson]()
    var lessonImg: [UIImage] = [#imageLiteral(resourceName: "MicrosoftTeams-image (6)"),#imageLiteral(resourceName: "MicrosoftTeams-image (5)"),#imageLiteral(resourceName: "MicrosoftTeams-image (7)"),#imageLiteral(resourceName: "MicrosoftTeams-image (6)"),#imageLiteral(resourceName: "MicrosoftTeams-image (5)"),#imageLiteral(resourceName: "MicrosoftTeams-image (7)"),#imageLiteral(resourceName: "MicrosoftTeams-image (6)"),#imageLiteral(resourceName: "MicrosoftTeams-image (5)"),#imageLiteral(resourceName: "MicrosoftTeams-image (6)"),#imageLiteral(resourceName: "MicrosoftTeams-image (5)"),#imageLiteral(resourceName: "MicrosoftTeams-image (7)")]
    var levelLbl: UILabel!
    var titleLabl : UILabel!
    var descriptionLbl: UILabel!
    
    
    var delegate: dismissVc?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print("appeared", unitDetailsIS.count)
        return unitDetailsIS.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! LessonableViewCell
        cell.customizeView()
        cell.lessonImage.image = lessonImg[indexPath.row]
        cell.titleLbl.text = unitDetailsIS[indexPath.row].unitName.capitalized
        cell.levelLabel.text = unitDetailsIS[indexPath.row].level.uppercased()
        cell.descriptionLabel.text = unitDetailsIS[indexPath.row].unitOverview.capitalized
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if unitDetailsIS[indexPath.row].totalPages != 0 {
            
            let tokenIs = getToken()
                
                let lessondetailVc = self.storyboard?.instantiateViewController(withIdentifier:"LessonDetailsViewController" ) as? LessonDetailsViewController
                 if let vc = lessondetailVc {
                    let loader = self.loader()

                     vc.objectOfLessonViewModel.callForLessonDetail(URLString: "https://app-e-learning-221207163844.azurewebsites.net/user/view/unitDetails?unitId=\(unitDetailsIS[indexPath.row].unitId)&limit=1&page=1", tokenTOSend: tokenIs){ (Bool) in
                        
                        DispatchQueue.main.async() {
                            self.stopLoader(loader: loader)
                        
                        
                             if Bool {
                                 vc.unitId = self.unitDetailsIS[indexPath.row].unitId
                                 vc.totalePages = self.unitDetailsIS[indexPath.row].totalPages
                                 self.navigationController?.pushViewController(vc, animated: true)
                             }else{
                                
                                DispatchQueue.main.async {
                                    self.alertMessage(message: "Error while loading the data try later ...!!!")
                                }
                                
                             }
                     }
                    
                       }

             }
            
        }else{
            
            self.alertMessage(message: "Sorry this unit does not contain any lesson details try after some time ...!!!")
            
        }
        
 
}

}

extension LessonViewController{
    
    
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
    
    
    
}
