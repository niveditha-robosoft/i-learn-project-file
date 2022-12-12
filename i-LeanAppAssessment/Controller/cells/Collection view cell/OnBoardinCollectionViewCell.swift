//
//  OnBoardinCollectionViewCell.swift
//  i-LeanAppAssessment
//
//  Created by Niveditha Naik on 06/12/22.
//

import UIKit

protocol goToLogInscreen{
    func go()
}

class OnBoardinCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: OnBoardinCollectionViewCell.self)
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var skipbutton: UIButton!
    
    var delegate:goToLogInscreen?
    
    func setup(_ slide: OnBoardingSlide){
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
        skipbutton.isHidden = false
    }
    
    @IBAction func skipToLogInScreen(_ sender: UIButton) {
        
        delegate?.go()
        
        
    }
    
    
    
    
}
