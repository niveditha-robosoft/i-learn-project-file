//
//  AudioTableViewCell.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 14/12/22.
//

import UIKit

class AudioTableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var expandButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    func customisecardview(){
        cardView.layer.cornerRadius = 10
    }
}

