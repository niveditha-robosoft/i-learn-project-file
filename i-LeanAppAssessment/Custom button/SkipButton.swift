//
//  SkipButton.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 11/12/22.
//

import Foundation
import UIKit
class SkipCustomButton: UIButton{
    
    
    override init(frame: CGRect) {

        super.init(frame: frame)

    }

    required init?(coder: NSCoder) {

        super.init(coder: coder)
        roundCorners()
    }

    func roundCorners() {

        let yourAttributes: [NSAttributedString.Key: Any] = [
              .font: UIFont.systemFont(ofSize: 16),
              .underlineStyle: NSUnderlineStyle.single.rawValue
          ]
        
        let attributeString = NSMutableAttributedString(
                string: "Skip",
                attributes: yourAttributes
             )
        
        self.setAttributedTitle(attributeString, for: .normal)
//        self.titleLabel?.font = UIFont(name: "Rubik Medium", size: 16)

        }
    
   

}
