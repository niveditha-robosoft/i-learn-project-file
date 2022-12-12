//
//  CustomButton.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 10/12/22.
//




import Foundation

import UIKit

class SkipCustomButtob: UIButton {

    override init(frame: CGRect) {

        super.init(frame: frame)

    }

    required init?(coder: NSCoder) {

        super.init(coder: coder)

    }

    func roundCorners(corners: UIRectCorner, radius: CGFloat) {

            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))

            let mask = CAShapeLayer()

            mask.path = path.cgPath

            layer.mask = mask

        }

}
