//
//  AboutSubjectTableViewCell.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 11/12/22.
//

import UIKit

class AboutSubjectTableViewCell: UITableViewCell {

    @IBOutlet weak var lessonName: UILabel!
    @IBOutlet weak var lessonNumber: UILabel!
    
    @IBOutlet weak var chapterOneName: UILabel!
    @IBOutlet weak var chapterOneDescription: UILabel!
    
    @IBOutlet weak var chapterTwoName: UILabel!
    @IBOutlet weak var chapterTwoDescription: UILabel!
    
    @IBOutlet weak var chapterThreeName: UILabel!
    @IBOutlet weak var chapterThreeDescription: UILabel!
    
    @IBOutlet weak var chapterFourName: UILabel!
    @IBOutlet weak var chapterFourDescription: UILabel!
    
    
    @IBOutlet weak var backView: UIView!
    
 
    
    func addUnitDetails(data: [UnitModel]) {
        
        for i in data{
            var cou = i.unitName.count
            
            for j in 0...cou
            {
                switch j {
                case 0:
                    chapterOneName.text = i.unitName
                    chapterOneDescription.text = i.unitOverview
                    print(i.unitName)
                case 1:
                    chapterOneName.text = i.unitName
                    chapterOneDescription.text = i.unitOverview
                    print(i.unitName)
                case 2:
                    chapterOneName.text = i.unitName
                    chapterOneDescription.text = i.unitOverview
                    print(i.unitName)
                case 3:
                    chapterOneName.text = i.unitName
                    chapterOneDescription.text = i.unitOverview
                    print(i.unitName)
                default:
                    return
                }
            }
            
            
        }
        
        
    }
    
    
    
    
}
