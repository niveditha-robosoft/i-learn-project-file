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
    
    var ObjectOfSignInVIewMOdel = SignInViewModel.objectOfViewModel
    
//    var objectOfLessonViewModel = LessonViewModel.objectOfviewModel
    
    var objectOfAboutSUbjectViewModel = AboutSUbjectViewModel()
    var unitDetailsIS = [UnitModel]()
    var objectOfSubjectListViewController = SubjectListViewModel.objectOfViewModel
    var objectOfLessonViewModel = LessonViewModel()
    var lessonDetails = [Lesson]()
    var lessonImg: [UIImage] = [#imageLiteral(resourceName: "img_pp"),#imageLiteral(resourceName: "icn_reults"),#imageLiteral(resourceName: "img_arrow_right_maincta"),#imageLiteral(resourceName: "icn_reults"),#imageLiteral(resourceName: "logo_ilearn"),#imageLiteral(resourceName: "imgpsh_fullsize_anim"),#imageLiteral(resourceName: "icn_notificationsettings")]
    var levelLbl: UILabel!
    var titleLabl : UILabel!
    var descriptionLbl: UILabel!
    
    
    var delegate: dismissVc?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
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
        
            
            let lessondetailVc = self.storyboard?.instantiateViewController(withIdentifier:"LessonDetailsViewController" ) as? LessonDetailsViewController
             if let vc = lessondetailVc {
                 vc.objectOfLessonViewModel.callForLessonDetail(URLString: "https://app-e-learning-221207163844.azurewebsites.net/user/view/unitDetails?unitId=\(unitDetailsIS[indexPath.row].unitId)&limit=1&page=1", tokenTOSend: "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJuaXZlZGl0aGFuYWlrMDFAZ21haWwuY29tIiwiZXhwIjoxNjcxODA4MDI5LCJpYXQiOjE2NzE3NzIwMjl9.L7soks2aRmLmvjGpEACMf-ym3RkH_mOvkgXuQZLVGQQl1ew-85UMUNWU3Cw5QjyY42aLVw4sMB5EIdycVzC01Q"){ (Bool) in
                         if Bool {
                             vc.unitId = self.unitDetailsIS[indexPath.row].unitId
                             vc.totalePages = self.unitDetailsIS[indexPath.row].totalPages
                             self.navigationController?.pushViewController(vc, animated: true)
                         }
                
                   }

         }
 
}

}
