//
//  LessonableViewCell.swift
//  i-LeanAppAssessment
//
//  Created by Niveditha Naik on 12/12/22.
//

import UIKit

class LessonableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
   @IBOutlet weak var lessonImage: UIImageView!
   @IBOutlet weak var levelLabel: UILabel!
   @IBOutlet weak var titleLbl: UILabel!
   @IBOutlet weak var descriptionLabel: UILabel!
   func customizeView(){
       cardView.layer.masksToBounds = false
   cardView.layer.cornerRadius = 20
       cardView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
   }

}
