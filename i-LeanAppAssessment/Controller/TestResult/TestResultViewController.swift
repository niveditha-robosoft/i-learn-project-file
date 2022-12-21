//
//  TestResultViewController.swift
//  i-LeanAppAssessment
//
//  Created by Niveditha Naik on 13/12/22.
//

import UIKit

class TestResultViewController: UIViewController {
   
    @IBOutlet weak var progressBar: ProgressBarViewTwo!
        @IBOutlet weak var creditLabel: UIView!
        @IBOutlet weak var tryAgain: UIButton!
        @IBOutlet weak var arrowRightButton: UIImageView!
        var timer: Timer!
        var progressCounter:Float = 0
        let duration:Float = 10.0
        var progressIncrement:Float = 0
        override func viewDidLoad() {
            super.viewDidLoad()
            tryAgain.layer.cornerRadius = 12
            creditLabel.layer.cornerRadius = 20
            arrowRightButton.layer.cornerRadius = 11.9
            progressIncrement = 1.0/duration
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.showProgress), userInfo: nil, repeats: true)
          
        }
        
        @objc func showProgress() {
        if(progressCounter > 1.0){timer.invalidate()}
        progressBar.progress = progressCounter
        progressCounter = progressCounter + progressIncrement
        }
       
        @IBAction func tryAgainButtonTapped(_ sender: Any) {
        //    showProgress()
        }
        
    }

    


