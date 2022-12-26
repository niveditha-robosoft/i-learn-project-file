//
//  CustomSearchViewShadow.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 26/12/22.
//

import Foundation

import UIKit

class CustomSearchViewShadow: UIView {

    override init(frame: CGRect) {

        super.init(frame: frame)

    }

    required init?(coder: NSCoder) {

        super.init(coder: coder)

        addShadow()

    }

    func addShadow() {

        self.layer.shadowColor = UIColor(red: 41/255, green: 94/255, blue: 255/255, alpha: 0.05).cgColor
        self.layer.shadowOpacity = 100
        self.layer.shadowRadius = 5
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        

    }

}
