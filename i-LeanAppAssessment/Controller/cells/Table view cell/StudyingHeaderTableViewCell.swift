//
//  StudyingHeaderTableViewCell.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 28/12/22.
//

import UIKit

class StudyingHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var lessonname: UILabel!
    @IBOutlet weak var lessonNumber: UILabel!
    @IBOutlet weak var headerBackgroundView: UIView!
    @IBOutlet weak var progressView: AboutHeaderProgress!
    @IBOutlet weak var headerTopView: UIView!
    
    
    var timer: Timer!
    var progressCounter:Float = 0
    var durationIs = 0
    var progressIncrement:Float = 0

    func progressInitiate() {
        
//        progressIncrement = 1.0/duration
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(call), userInfo: nil, repeats: true)

    }
    
    @objc func call() {
        showProgress(duration: durationIs)
    }
    
    func showProgress(duration: Int) {
    progressView.progress = (Float(duration)/Float(100))
    }
    
    func progressPercentage(value: Int) {
        
        durationIs = value

    }
    
    
    func setTopTwoCornerRadius() {
        
        headerBackgroundView.clipsToBounds = true
        headerBackgroundView.layer.masksToBounds = true
        headerBackgroundView.layer.cornerRadius = 18.0
        headerBackgroundView.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
    }
    
    

}
