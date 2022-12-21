//
//  ResultsTableViewCell.swift
//  ForgotPassword
//
//  Created by Shrushti Shetty on 08/12/22.
//

import UIKit

class ResultsTableViewCell: UITableViewCell {
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var subjectName: UILabel!
    @IBOutlet weak var lessonNumber: UILabel!
    @IBOutlet weak var lessonName: UILabel!
    @IBOutlet weak var rightAnswerLabel: UILabel!
    @IBOutlet weak var numberOfRightAnswers: UILabel!
    @IBOutlet weak var questionsAttemptedLabel: UILabel!
    @IBOutlet weak var numberOfQuestionAttempted: UILabel!
    @IBOutlet weak var percentage: UILabel!
    @IBOutlet weak var totalNumberOfQuestions: UILabel!
    func customizeView(){
        cardView.layer.masksToBounds = false
        cardView.layer.cornerRadius = 10
        cardView.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
    }
}
