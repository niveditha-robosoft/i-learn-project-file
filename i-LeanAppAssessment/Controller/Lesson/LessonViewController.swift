//
//  LessonViewController.swift
//  i-LeanAppAssessment
//
//  Created by Niveditha Naik on 12/12/22.
//

import UIKit

class LessonViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//    var objectOfLessonViewModel = LessonViewModel.objectOfviewModel
    var lessonImg: [UIImage] = [#imageLiteral(resourceName: "btn_back"),#imageLiteral(resourceName: "btn_back"),#imageLiteral(resourceName: "btn_signin-1")]
    var levelLbl = ["Food Substances","Balanced Diet","Food Test"]
    var descriptionLbl = ["Classes and sources","Balanced Diet","Food Test"]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return levelLbl.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! LessonableViewCell
        cell.customizeView()
        cell.lessonImage.image = lessonImg[indexPath.row]
        cell.levelLabel.text =  levelLbl[indexPath.row]
        cell.descriptionLabel.text = descriptionLbl[indexPath.row]
        return cell
    }


}
