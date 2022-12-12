//
//  SubjectDetailsViewController.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 10/12/22.
//

import UIKit

class SubjectDetailsViewController: UIViewController {
    @IBOutlet weak var allButton: SkipCustomButtob!
    @IBOutlet weak var likedButton: SkipCustomButtob!
    @IBOutlet weak var studyingButton: UIButton!
    
    @IBOutlet weak var detailsOfTheSubject: UIView!
    @IBOutlet weak var studying: UIView!
    @IBOutlet weak var liked: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.bringSubviewToFront(detailsOfTheSubject)
        allButton.setTitleColor(#colorLiteral(red: 0.2980392157, green: 0.5764705882, blue: 1, alpha: 1), for: .normal)
        likedButton.setTitleColor(#colorLiteral(red: 0.5568627451, green: 0.5607843137, blue: 0.5764705882, alpha: 1), for: .normal)
        studyingButton.setTitleColor(#colorLiteral(red: 0.5568627451, green: 0.5607843137, blue: 0.5764705882, alpha: 1), for: .normal)
        studying.isHidden = true
        liked.isHidden = true
        allButton.roundCorners(corners: [.bottomLeft,.topLeft], radius: 12)

        likedButton.roundCorners(corners: [.bottomRight,.topRight], radius: 12)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func allbuttonTapped(_ sender: Any) {
        view.bringSubviewToFront(detailsOfTheSubject)
        detailsOfTheSubject.isHidden = false
        studying.isHidden = true
        liked.isHidden = true
        allButton.setTitleColor(#colorLiteral(red: 0.2980392157, green: 0.5764705882, blue: 1, alpha: 1), for: .normal)
        likedButton.setTitleColor(#colorLiteral(red: 0.5568627451, green: 0.5607843137, blue: 0.5764705882, alpha: 1), for: .normal)
        studyingButton.setTitleColor(#colorLiteral(red: 0.5568627451, green: 0.5607843137, blue: 0.5764705882, alpha: 1), for: .normal)
    }
    
    @IBAction func subjectButtonTapped(_ sender: Any) {
        view.bringSubviewToFront(studying)
        studying.isHidden = false
        detailsOfTheSubject.isHidden = true
        liked.isHidden = true
        allButton.setTitleColor(#colorLiteral(red: 0.5568627451, green: 0.5607843137, blue: 0.5764705882, alpha: 1), for: .normal)
        likedButton.setTitleColor(#colorLiteral(red: 0.5568627451, green: 0.5607843137, blue: 0.5764705882, alpha: 1), for: .normal)
        studyingButton.setTitleColor(#colorLiteral(red: 0.2980392157, green: 0.5764705882, blue: 1, alpha: 1), for: .normal)
    }
    
    @IBAction func likeButtonTapped(_ sender: Any) {
        view.bringSubviewToFront(liked)
        detailsOfTheSubject.isHidden = true
        studying.isHidden = true
        liked.isHidden = false
        allButton.setTitleColor(#colorLiteral(red: 0.5568627451, green: 0.5607843137, blue: 0.5764705882, alpha: 1), for: .normal)
        likedButton.setTitleColor(#colorLiteral(red: 0.2980392157, green: 0.5764705882, blue: 1, alpha: 1), for: .normal)
        studyingButton.setTitleColor(#colorLiteral(red: 0.5568627451, green: 0.5607843137, blue: 0.5764705882, alpha: 1), for: .normal)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
