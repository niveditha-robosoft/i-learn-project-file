//
//  OptionsCustomButton.swift
//  i-LeanAppAssessment
//
//  Created by Shrushti Shetty on 22/12/22.
//

import Foundation

import UIKit

class OptionsCustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        cornerRadiusOptions()
    }
    func cornerRadiusOptions() {
        self.layer.cornerRadius = 18
    }
}
