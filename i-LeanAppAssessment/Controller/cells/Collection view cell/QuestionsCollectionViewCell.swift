//
//  QuestionsCollectionViewCell.swift
//  i-LeanAppAssessment
//
//  Created by Shrushti Shetty on 14/12/22.
//

import Foundation
import UIKit

enum SelectedOption{
    case optionA
    case optionB
    case optionC
    case optionD
}
//protocol AllQuestionsAnswered {
//    func completedTest()
//}
class QuestionsCollectionViewCell: UICollectionViewCell {
    let questionVM = QuestionsViewModel.shared
    
    let questionListVM = QuestionListViewModel.shared
    
//    let testVM = TestViewModel.shared
    
    let submitVM = ResultViewModel.shared
    var optionAText: String = ""
    var optionBText: String = ""
    var optionCText: String = ""
    var optionDText: String = ""

    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    var curentIndex = 0
    var currentQuestionID = 2
    var currentTestID = 0
    var currentLessonID = 0
    func defaultButtonBorderText(){
        optionA.layer.borderWidth = 0
        optionB.layer.borderWidth = 0
        optionC.layer.borderWidth = 0
        optionD.layer.borderWidth = 0
        optionA.setTitleColor(#colorLiteral(red: 0.5568627451, green: 0.5607843137, blue: 0.5764705882, alpha: 1), for: .normal)
        optionB.setTitleColor(#colorLiteral(red: 0.5568627451, green: 0.5607843137, blue: 0.5764705882, alpha: 1), for: .normal)
        optionC.setTitleColor(#colorLiteral(red: 0.5568627451, green: 0.5607843137, blue: 0.5764705882, alpha: 1), for: .normal)
        optionD.setTitleColor(#colorLiteral(red: 0.5568627451, green: 0.5607843137, blue: 0.5764705882, alpha: 1), for: .normal)
    }
    @IBAction func onClickOptionA(_ sender: UIButton) {
        changeBorder(selectedOption: sender)
    }
    @IBAction func onClickOptionB(_ sender: UIButton) {
        changeBorder(selectedOption: sender)
    }
    @IBAction func onClickOptionC(_ sender: UIButton) {
        changeBorder(selectedOption: sender)
    }
    @IBAction func onClickOptionD(_ sender: UIButton) {
        changeBorder(selectedOption: sender)
    }
    
    func changeBorder(selectedOption: UIButton) {
        print("option selected", currentQuestionID)
        if let optionText = selectedOption.title(for: .normal){
            questionVM.answersList[currentQuestionID] = Answer(testId: self.currentTestID, lessonId: currentLessonID, questionId: currentQuestionID, givenAnswer: optionText)
            print("TESTIDDD",self.currentTestID)
        }
        switch selectedOption {
        case optionA:
            borderOnClickingOption(button: optionA, borderWidth: 1,textColor: #colorLiteral(red: 0.3614955544, green: 0.654981792, blue: 1, alpha: 1))
            borderOnClickingOption(button: optionB)
            borderOnClickingOption(button: optionC)
            borderOnClickingOption(button: optionD)
            submitVM.assignParameters(testId: self.currentTestID, lessonId: currentLessonID)
            storeAnswer(questionId: currentQuestionID, answer: optionAText)
            print("currentID", currentTestID)
            
        case optionB:
            borderOnClickingOption(button: optionA)
            borderOnClickingOption(button: optionB, borderWidth: 1,textColor: #colorLiteral(red: 0.3614955544, green: 0.654981792, blue: 1, alpha: 1))
            borderOnClickingOption(button: optionC)
            borderOnClickingOption(button: optionD)
            submitVM.assignParameters(testId: self.currentTestID, lessonId: currentLessonID)
            print("currentID", currentTestID)
            storeAnswer(questionId: currentQuestionID, answer: optionBText )

        case optionC:
            borderOnClickingOption(button: optionA)
            borderOnClickingOption(button: optionB)
            borderOnClickingOption(button: optionC, borderWidth: 1,textColor: #colorLiteral(red: 0.3614955544, green: 0.654981792, blue: 1, alpha: 1))
            borderOnClickingOption(button: optionD)
            submitVM.assignParameters(testId: self.currentTestID, lessonId: currentLessonID)
            print("currentID", currentTestID)
            storeAnswer(questionId: currentQuestionID, answer: optionCText )

        case optionD:
            borderOnClickingOption(button: optionA)
            borderOnClickingOption(button: optionB)
            borderOnClickingOption(button: optionC)
            borderOnClickingOption(button: optionD, borderWidth: 1,textColor: #colorLiteral(red: 0.3614955544, green: 0.654981792, blue: 1, alpha: 1))
            submitVM.assignParameters(testId: self.currentTestID, lessonId: currentLessonID)
            print("currentID", currentTestID)
            storeAnswer(questionId: currentQuestionID, answer: optionDText )

        default:
            borderOnClickingOption(button: optionA)
            borderOnClickingOption(button: optionB)
            borderOnClickingOption(button: optionC)
            borderOnClickingOption(button: optionD)
            //submitVM.assignParameters(testId: self.currentTestID, lessonId: currentLessonID)
    
        }
        questionListVM.highlightIndex.append(curentIndex)
        
    }
    
    func borderOnClickingOption(button: UIButton, borderWidth: CGFloat = 0, textColor: UIColor = #colorLiteral(red: 0.5568627451, green: 0.5607843137, blue: 0.5764705882, alpha: 1)) {
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = #colorLiteral(red: 0.2980392157, green: 0.5764705882, blue: 1, alpha: 1)
        button.setTitleColor(textColor, for: .normal)
    }
    
    func storeAnswer(questionId: Int, answer: String) {
        print(questionId,"shrushtishetty")
          answerList[questionId] = answer
    }
}
var answerList: [Int: String] = [:]
