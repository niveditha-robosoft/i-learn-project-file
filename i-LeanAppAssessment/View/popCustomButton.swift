//
//  popCustomButton.swift
//  i-LeanAppAssessment
//
//  Created by Shrushti Shetty on 29/12/22.
//

import Foundation
import UIKit
class customPopupButton: UIButton{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func selected(){
        
        self.layer.backgroundColor = #colorLiteral(red: 0.2980392157, green: 0.5764705882, blue: 1, alpha: 1)
        self.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
    }
    
    func deselect(){
        
        self.layer.borderWidth = 2
        self.layer.borderColor = #colorLiteral(red: 0.2980392157, green: 0.5764705882, blue: 1, alpha: 1)
        self.setTitleColor(#colorLiteral(red: 0.2980392157, green: 0.5764705882, blue: 1, alpha: 1), for: .normal)
        self.layer.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
       
    }
}
