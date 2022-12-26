//
//  ProfileScreenView.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 26/12/22.
//

import Foundation

import UIKit

class ProfileScreenView: UIView {

    override init(frame: CGRect) {

        super.init(frame: frame)

    }

    required init?(coder: NSCoder) {

        super.init(coder: coder)

        addBorder()

    }

    func addBorder() {

        self.layer.cornerRadius = 18

    }

}
