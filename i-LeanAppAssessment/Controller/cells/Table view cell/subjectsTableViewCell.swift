//
//  subjectsTableViewCell.swift
//  SubjectsViewController
//
//  Created by Niveditha Naik on 07/12/22.
//

import UIKit

class subjectsTableViewCell: UITableViewCell {
@IBOutlet weak var cardView: UIView!
@IBOutlet weak var subjectImage: UIImageView!
@IBOutlet weak var subjectlabel: UILabel!
    func customizeCardView() {
        cardView.layer.masksToBounds = true
        cardView.layer.cornerRadius = 10
        cardView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}
