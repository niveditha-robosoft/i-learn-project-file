//
//  TimeOutViewController.swift
//  i-LeanAppAssessment
//
//  Created by Shrushti Shetty on 17/12/22.
//

import UIKit

class TimeOutViewController: UIViewController {
    
    var viewModel = ResultViewModel.shared
    var viewModel2 = TestViewController()
    
    @IBOutlet weak var takeNewTestButton: UIButton!
    @IBOutlet weak var progressBar: ProgressBarView!
    @IBOutlet weak var creditLabel: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var arrowRightButton: UIImageView!
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var numberOfQuestionsAttempted: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    
    var percentageProgress = 0
    var percentge:String = "0"
    var totalQuestions:String = "0"
    var questionsAttempted:String = "0"
    var numberOfQuestionsAttemptedText = ""
    var wrongAnswers = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        percentageLabel.text = "\(percentge)"
        numberOfQuestionsAttempted.text = "\(viewModel.questionsAttempts) of \(viewModel.totalQuestion)"
    }
    func assignLabels() {
        percentge = "\(viewModel.percentge)"
        totalQuestions = "\(viewModel.totalQuestion)"
        questionsAttempted = "\(viewModel.questionsAttempts)"
        percentge = "\(viewModel.percentge)"
        numberOfQuestionsAttemptedText = "\(viewModel.questionsAttempts)"
        wrongAnswers = "\(viewModel.wrongAnswer)"
        percentageProgress = Int(viewModel.percentge) ?? 0
    }
    
    @IBAction func takeNewTestClicked(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LessonTestViewController") as! LessonTestViewController
        vc.isLessonShown = false
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
