//
//  TestScoreViewController.swift
//  i-LeanAppAssessment
//
//  Created by Shrushti Shetty on 14/12/22.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
    
    var viewModel = ResultViewModel.shared
    var viewModel2 = TestViewController()
    var vm3 = QuestionsViewModel.shared
    var testId: Int?
    var lessonId: Int?
    var objectOfAboutSUbjectViewModel = AboutSUbjectViewModel.objectOfAboutSUbjectViewModel
    @IBOutlet weak var progressBar: ProgressBarViewTwo!
    @IBOutlet weak var creditLabel: UIView!
    @IBOutlet weak var tryAgain: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var arrowRightButton: UIImageView!
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var numberOfQuestionsAttempted: UILabel!
    
    var timer: Timer!
    var progressCounter:Float = 0
    var progressIncrement:Float = 0
    var percentageProgress = 0
    var percentge:String = "0"
    var totalQuestions:String = "0"
    var questionsAttempted:String = "0"
    var numberOfQuestionsAttemptedText = ""
    var wrongAnswers = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tryAgain.layer.shadowColor = UIColor(red: 76/255, green: 147/255, blue: 255/255, alpha: 0.05).cgColor
        tryAgain.layer.shadowOpacity = 100
        tryAgain.layer.shadowRadius = 5
        tryAgain.layer.shadowOffset = CGSize(width: 0, height: 2)
        tryAgain.layer.cornerRadius = 12
        creditLabel.layer.cornerRadius = 20
        arrowRightButton.layer.cornerRadius = 11.9
        percentageLabel.text = "\(percentge)"
        numberOfQuestionsAttempted.text = "\(viewModel.questionsAttempts) of \(viewModel.totalQuestion)"
        descriptionLabel.text = "You are just \(wrongAnswers) correct questions away from 100%. You can do it."
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(callProgressPercent), userInfo: nil, repeats: true)
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
    
    @objc func callProgressPercent() {
        showProgress(Progress1: percentageProgress)
    }
    
    func showProgress(Progress1: Int) {
        progressBar.progress = (Float(percentageProgress)/Float(100))
    }
    
    
    @IBAction func tryAgainButtonTapped(_ sender: Any) {
        viewModel.tryAgainClick += 1
        answerList.removeAll()
//        viewModel.assignAnswer()
        print(viewModel.tryAgainClick,"try again click count")
        if viewModel.tryAgainClick > 2 {
            let alert = UIAlertController(title: "Alert", message: "You can only attempt the test three times", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: {_ in
                for controller in self.navigationController!.viewControllers as Array {
                    if controller.isKind(of: LessonTestViewController.self) {
                        self.navigationController!.popToViewController(controller, animated: true)
                        break
                    }
                }
            }))
            self.present(alert, animated: true)
            
        }
        else {
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "QuestionsViewController") as? QuestionsViewController else {print("vc error");return}
            if let id = testId{
                print(id)
                vm3.fetchQuestions(key: "testId", value: id) { (data, error) in
                    if data! {
                    }
                    print(vc.viewModel2.questionListArray.count)
                }
            }

            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

