//
//  StudyingBodyTableViewCell.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 28/12/22.
//

import UIKit

class StudyingBodyTableViewCell: UITableViewCell {

    @IBOutlet weak var chapterOneName: UILabel!
    @IBOutlet weak var chapterOneDescription: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var cellBackgroundView: UIView!
    
    @IBOutlet weak var cellTapView: UIView!
    
    var lessonID123: Int?
    func setRadious(x: Bool) {
        
        
        if x == true{
            
        statusLabel.layer.masksToBounds = true
            statusLabel.layer.cornerRadius = 6.0
        statusLabel.backgroundColor = #colorLiteral(red: 0.0431372549, green: 0.7803921569, blue: 0.3882352941, alpha: 1)
        }else{
            statusLabel.layer.masksToBounds = true
            statusLabel.layer.cornerRadius = 6.0
            statusLabel.backgroundColor = #colorLiteral(red: 0.8745098039, green: 0.8745098039, blue: 0.8745098039, alpha: 1)
            
        }
    }
    
    func setTopTwoCornerRadius() {
        
        cellBackgroundView.clipsToBounds = true

        cellBackgroundView.layer.masksToBounds = true
        cellBackgroundView.layer.cornerRadius = 18.0
        cellBackgroundView.layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
    }
}
