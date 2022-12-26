//
//  HomeScreenCollectionViewCell.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 07/12/22.
//

import UIKit

class HomeScreenCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var subjectName: UILabel!
    @IBOutlet weak var chapterName: UILabel!
    @IBOutlet weak var progressPercentage: UILabel!
    @IBOutlet weak var contentBackgroundView: UIView!
    @IBOutlet weak var progrssBar: UIProgressView!
    func contentBackgroundShadow(){
        

       

                

        contentBackgroundView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor

        contentBackgroundView.layer.shadowOpacity = 100

        contentBackgroundView.layer.shadowRadius = 5

        contentBackgroundView.layer.shadowOffset = CGSize(width: 0, height: 2)
    }
}
