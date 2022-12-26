//
//  CustomVarifyTextField.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 26/12/22.
//

import Foundation
import UIKit

class CustomVarifyTextField: UITextField {

    override init(frame: CGRect) {

        super.init(frame: frame)

    }

    required init?(coder: NSCoder) {

        super.init(coder: coder)


    }

    func hideError() {

        self.layer.borderWidth = 2.0
        self.layer.cornerRadius = 8.0
        self.layer.borderColor = #colorLiteral(red: 0.9529411765, green: 0.9764705882, blue: 0.9803921569, alpha: 1)

    }
    
    func showError() {
        
        self.layer.borderWidth = 2.0
        self.layer.cornerRadius = 8.0
        self.layer.borderColor = #colorLiteral(red: 0.9725490196, green: 0.568627451, blue: 0.568627451, alpha: 1)
        
    }
    

}
