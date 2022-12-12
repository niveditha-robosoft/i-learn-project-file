//
//  ProgressBar.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 12/12/22.
//

import Foundation

import UIKit

//class ProgressBarView: UIView {
//
//     var bgPath: UIBezierPath!
//
//     var shapeLayer: CAShapeLayer!
//
//     var progressLayer: CAShapeLayer!
//
//    var progress: Float = 0 {
//
//         willSet(newValue)
//
//         {
//
//             progressLayer.strokeEnd = CGFloat(newValue)
//
//         }
//
//    }
//
//    override init(frame: CGRect) {
//
//            super.init(frame: frame)
//
//            bgPath = UIBezierPath()
//
//            self.simpleShape()
//
//        }
//
//        
//
//        required public init?(coder aDecoder: NSCoder) {
//
//            super.init(coder: aDecoder)
//
//            bgPath = UIBezierPath()
//
//            self.simpleShape()
//
//        }
//
//    
//
//  private func createCirclePath() {
//
//        let x = self.frame.width/2
//
//        let y = self.frame.height/2
//
//        let center = CGPoint(x: x, y: y)
//
//        let startAngle = CGFloat.pi/2
//
//        bgPath.addArc(withCenter: center, radius: x, startAngle: CGFloat.pi/2, endAngle: 2 * CGFloat.pi + startAngle, clockwise: true)
//
//        bgPath.close()
//
//    }
//
//    func simpleShape() {
//
//        createCirclePath()
//
//        shapeLayer = CAShapeLayer()
//
//        shapeLayer.path = bgPath.cgPath
//
//        shapeLayer.lineWidth = 20
//
//        shapeLayer.fillColor = nil
//
//        shapeLayer.strokeColor =  colorLiteral(red: 0.8941176471, green: 0.9019607843, blue: 0.9137254902, alpha: 1)
//
//        progressLayer = CAShapeLayer()
//
//        progressLayer.path = bgPath.cgPath
//
//        progressLayer.lineWidth = 20
//
//        progressLayer.lineCap = CAShapeLayerLineCap.round
//
//        progressLayer.fillColor = nil
//
//        progressLayer.strokeColor =  colorLiteral(red: 0.0431372549, green: 0.7803921569, blue: 0.3882352941, alpha: 1)
//
//        progressLayer.strokeEnd = 0.0
//
//        self.layer.addSublayer(shapeLayer)
//
//        self.layer.addSublayer(progressLayer)
//
//    }
//
//}
