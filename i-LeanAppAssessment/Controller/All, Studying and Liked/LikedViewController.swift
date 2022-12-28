//
//  LikedViewController.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 10/12/22.
//

import UIKit

class LikedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var objectOfLikedUnitViewMOdel = LikedUnitViewMOdel.objectOfViewMOdel
    
    var objectOfUserDefaults = UserDefaults()
    var objectOfKeyChain = KeyChain()
    
    @IBOutlet weak var noLikedUnits: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        callApi()

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectOfLikedUnitViewMOdel.lokedUnitDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! LikedUnitsTableViewCell
        cell.subjectImage.image = #imageLiteral(resourceName: "imgpsh_fullsize_anim")
        cell.subjectName.text = objectOfLikedUnitViewMOdel.lokedUnitDetails[indexPath.row].subjectName.uppercased()
        cell.lessonName.text = objectOfLikedUnitViewMOdel.lokedUnitDetails[indexPath.row].lessonName.capitalized
        cell.unitName.text = objectOfLikedUnitViewMOdel.lokedUnitDetails[indexPath.row].unitName.capitalized
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("id id id : \(objectOfLikedUnitViewMOdel.lokedUnitDetails[indexPath.row].lessonId)")
        
        
        let detailVc = self.storyboard?.instantiateViewController(withIdentifier: "LessonTestViewController") as? LessonTestViewController
        
        if let vc = detailVc{
            
            vc.statusXY = 1
            
            print("999 : \(objectOfLikedUnitViewMOdel.lokedUnitDetails[indexPath.row].lessonNumber)")
            vc.likedLessonNUmber = objectOfLikedUnitViewMOdel.lokedUnitDetails[indexPath.row].lessonNumber
            vc.likedSubject = objectOfLikedUnitViewMOdel.lokedUnitDetails[indexPath.row].subjectName
            vc.likedLessonId = objectOfLikedUnitViewMOdel.lokedUnitDetails[indexPath.row].lessonId
            vc.likedLessonName = objectOfLikedUnitViewMOdel.lokedUnitDetails[indexPath.row].lessonName
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    func callApi() {
        
        let tokenToSend = getToken()
        
        let loader =   self.loader()

        objectOfLikedUnitViewMOdel.likedUnitsData(tokenToSend: tokenToSend){ status in
            
            DispatchQueue.main.async() {
                self.stopLoader(loader: loader)
            if status == true{
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.tableView.isHidden = false
                    self.noLikedUnits.isHidden = true
                }
                
                
            }else{
                
                DispatchQueue.main.async {
                    self.tableView.isHidden = true
                    self.noLikedUnits.isHidden = false
                }
                
                
            }
        }
            
        }
        
        
    }


}


extension  LikedViewController{
    
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
