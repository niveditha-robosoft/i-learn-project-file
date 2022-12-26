//
//  subjectsTableViewCell.swift
//  SubjectsViewController
//
//  Created by Niveditha Naik on 07/12/22.
//

import UIKit

class subjectsTableViewCell: UITableViewCell {
@IBOutlet weak var cardView: TableCellCornerRadius!
@IBOutlet weak var subjectImage: UIImageView!
@IBOutlet weak var subjectlabel: UILabel!
    func customizeCardView() {
        cardView.layer.masksToBounds = true
        cardView.layer.cornerRadius = 10
        cardView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        cardView.layer.shadowColor = UIColor(red: 41/255, green: 94/255, blue: 255/255, alpha: 0.05).cgColor
        cardView.layer.shadowOpacity = 100
        cardView.layer.shadowRadius = 5
        cardView.layer.shadowOffset = CGSize(width: 0, height: 2)
    }
}
