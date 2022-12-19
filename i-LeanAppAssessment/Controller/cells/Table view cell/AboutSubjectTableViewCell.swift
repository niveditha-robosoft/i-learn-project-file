//
//  AboutSubjectTableViewCell.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 11/12/22.
//

import UIKit

class AboutSubjectTableViewCell: UITableViewCell {


    
    @IBOutlet weak var chapterOneName: UILabel!
    @IBOutlet weak var chapterOneDescription: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
    
    
    func setRadious(x: Int) {
        
        
        if x == 1{
            
        statusLabel.layer.masksToBounds = true
            statusLabel.layer.cornerRadius = 6.0
        statusLabel.backgroundColor = #colorLiteral(red: 0.0431372549, green: 0.7803921569, blue: 0.3882352941, alpha: 1)
        }else{
            statusLabel.layer.masksToBounds = true
            statusLabel.layer.cornerRadius = 6.0
            statusLabel.backgroundColor = #colorLiteral(red: 0.8745098039, green: 0.8745098039, blue: 0.8745098039, alpha: 1)
            
        }
    }
    
}
