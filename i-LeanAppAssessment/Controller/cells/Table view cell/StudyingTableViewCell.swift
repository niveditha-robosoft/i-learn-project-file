//
//  StudyingTableViewCell.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 24/12/22.
//

import UIKit

class StudyingTableViewCell: UITableViewCell {

    @IBOutlet weak var subjectImage: UIImageView!
    @IBOutlet weak var subjectName: UILabel!
    @IBOutlet weak var lessonName: UILabel!
    
    @IBOutlet weak var backView: UIView!
    
    
    func setCornerRadius() {
        
        backView.layer.cornerRadius = 14.0
        
    }
    
    
}
