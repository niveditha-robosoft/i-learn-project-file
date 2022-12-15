//
//  LessonViewController.swift
//  i-LeanAppAssessment
//
//  Created by Niveditha Naik on 12/12/22.
//

import UIKit

class LessonViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var unitDetailsIS = [UnitModel]()
    var objectOfSubjectListViewController = SubjectListViewModel.objectOfViewModel
    var objectOfLessonViewModel = LessonViewModel()
    var lessonDetails = [Lesson]()
    var lessonImg: [UIImage] = [#imageLiteral(resourceName: "img_geography"),#imageLiteral(resourceName: "round"),#imageLiteral(resourceName: "btn_signin-1"),#imageLiteral(resourceName: "icn_reults"),#imageLiteral(resourceName: "logo_ilearn"),#imageLiteral(resourceName: "imgpsh_fullsize_anim"),#imageLiteral(resourceName: "icn_notificationsettings")]
    //var levelLbl = ["beginner","beginner","Beginner"]
    var levelLbl: UILabel!
    var titleLabl : UILabel!
    var descriptionLbl: UILabel!
   // var descriptionLbl = ["Classes and sources","Balanced Diet","Food Test"]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return unitDetailsIS.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! LessonableViewCell
        cell.customizeView()
        cell.lessonImage.image = lessonImg[indexPath.row]
        cell.titleLbl.text = unitDetailsIS[indexPath.row].unitName
        cell.levelLabel.text = unitDetailsIS[indexPath.row].level
        cell.descriptionLabel.text = unitDetailsIS[indexPath.row].unitOverview
        
       
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        print("unit id : ",unitDetailsIS[indexPath.row].unitId)
        
       let lessondetailVc = self.storyboard?.instantiateViewController(withIdentifier:"LessonDetailsViewController" ) as? LessonDetailsViewController
        if let vc = lessondetailVc {
            print("fvsdfdsgdfghfghfgjhjghkhjkhjljljkkl",unitDetailsIS[indexPath.row].unitId)
            vc.unitId = unitDetailsIS[indexPath.row].unitId
          self.navigationController?.pushViewController(vc, animated: true)     }

    }

}
