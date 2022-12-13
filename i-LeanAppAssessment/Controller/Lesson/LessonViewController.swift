//
//  LessonViewController.swift
//  i-LeanAppAssessment
//
//  Created by Niveditha Naik on 12/12/22.
//

import UIKit

class LessonViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   static var shared = LessonViewModel()
 
    var lessonImg: [UIImage] = [#imageLiteral(resourceName: "btn_back"),#imageLiteral(resourceName: "btn_back"),#imageLiteral(resourceName: "btn_signin-1")]
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
        LessonViewModel.shared.lessonsList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! LessonableViewCell
        cell.customizeView()
        cell.lessonImage.image = lessonImg[indexPath.row]
        cell.titleLbl.text = LessonViewModel.shared.lessonsList[indexPath.row].unitName
        cell.levelLabel.text = LessonViewModel.shared.lessonsList[indexPath.row].level
        cell.descriptionLabel.text = LessonViewModel.shared.lessonsList[indexPath.row].unitOverView
       
        return cell
    }


}
