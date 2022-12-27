//
//  TestTableViewCell.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 23/12/22.
//

import UIKit

protocol beginTest {

    func testBegin(index: IndexPath, testId: Int)

}

 

class TestTableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!

    @IBOutlet weak var testImage: UIImageView!

    @IBOutlet weak var testLevels: UILabel!

    @IBOutlet weak var testTitleLbl: UILabel!

    @IBOutlet weak var descriptionLabel: UILabel!

    @IBOutlet weak var beginTestButton: UIButton!
    var index: IndexPath?
    var testId: Int?
    var lessonId: Int?

    var delegate: beginTest?

    

    func customizeView(){

        cardView.layer.masksToBounds = false

        cardView.layer.cornerRadius = 10

        cardView.backgroundColor =  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

    }

    

    func generateDescription(duration: Int, numberOfQuestion: Int, marks: Int) {

        descriptionLabel.text = "You have \(duration) minutes to answer all \(numberOfQuestion) questions. For each right ans \(marks) marks."

    }

 

    @IBAction func beginTestButtonClicked(_ sender: Any) {

        delegate?.testBegin(index: index!, testId: testId!)

    }

}
