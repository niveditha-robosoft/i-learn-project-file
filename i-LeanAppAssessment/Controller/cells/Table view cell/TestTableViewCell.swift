//
//  TestTableViewCell.swift
//  i-LeanAppAssessment
//
//  Created by Niveditha Naik on 23/12/22.
//

import UIKit

class TestTableViewCell: UITableViewCell {

    protocol beginTest {

        func testBegin()

    }
    @IBOutlet weak var cardView: UIView!

        @IBOutlet weak var testImage: UIImageView!

        @IBOutlet weak var testLevels: UILabel!

        @IBOutlet weak var testTitleLbl: UILabel!

        @IBOutlet weak var descriptionLabel: UILabel!

        @IBOutlet weak var beginTestButton: UIButton!

        

        var delegate: beginTest?

        

        func customizeView(){

            cardView.layer.masksToBounds = false

            cardView.layer.cornerRadius = 10

            cardView.backgroundColor =  colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

        }

        

        func generateDescription(duration: Int, numberOfQuestion: Int, marks: Int) {

            descriptionLabel.text = "You have \(duration) minutes to answer all \(numberOfQuestion) questions. For each right ans \(marks) marks."

        }

     

        @IBAction func beginTestButtonClicked(_ sender: Any) {

            delegate?.testBegin()

        }

}
