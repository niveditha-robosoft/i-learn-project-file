//
//  TestTableViewCell.swift
//  i-LeanAppAssessment
//
//  Created by Niveditha Naik on 12/12/22.
//

import UIKit

class TestTableViewCell: UITableViewCell {

    @IBOutlet weak var beginTestButton: UIButton!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var testImage: UIImageView!
@IBOutlet weak var testTitleLbl: UILabel!
@IBOutlet weak var descriptionLabel: UILabel!

    
    
    func customizeView(){
        cardView.layer.masksToBounds = false
        cardView.layer.cornerRadius = 10
        cardView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }

}
