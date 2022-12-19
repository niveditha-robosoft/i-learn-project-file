//
//  BottomUpCollectionViewCell.swift
//  i-LeanAppAssessment
//
//  Created by Niveditha Naik on 15/12/22.
//

import UIKit

class BottomUpCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var numberLabel: UILabel!
   

    
    
    override var isSelected: Bool{
        didSet{
            if self.isSelected
               {
                 self.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                self.numberLabel.textColor = #colorLiteral(red: 0.07450980392, green: 0.4509803922, blue: 0.9254901961, alpha: 1)
                self.numberLabel.font = UIFont(name: "Helvetica Neue", size:40)
               }
               else
               {
                 self.transform = CGAffineTransform.identity
                self.numberLabel.textColor = #colorLiteral(red: 0.7450980392, green: 0.7450980392, blue: 0.7450980392, alpha: 1)
                self.numberLabel.font = UIFont(name: "Helvetica Neue", size: 26)

               }
          }
      }
}
