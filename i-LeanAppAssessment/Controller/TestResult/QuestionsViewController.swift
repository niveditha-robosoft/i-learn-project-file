//
//  QuestionsViewController.swift
//  i-LeanAppAssessment
//
//  Created by Shrushti Shetty on 14/12/22.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    @IBOutlet weak var leftMoveButton: UIButton!
    @IBOutlet weak var rightMoveButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var questionCountsLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var timer: Timer?
    var elapsedTime: TimeInterval = 0
    let duration: TimeInterval = 3600
    var viewModel = QuestionsViewModel.shared
    private var isPopUpShown = false
    var viewModel2 = QuestionListViewModel.shared
    var updateTime = 60
    var currentPage = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        print(viewModel.questionsWithOptionList.count,"count from options")
        print(viewModel2.questionListArray.count,"countFor qu")
        self.questionCountsLabel.text = String(currentPage+1) +  " " + "of" + " " + String(viewModel.questionsWithOptionList.count) + " " + "question"
        progressBar.progress = 0
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateProgress() {
        elapsedTime += 1
        let progress = elapsedTime / duration
        let remainingTime = duration - elapsedTime
        let minutes = Int(remainingTime / 60)
        progressBar.setProgress(Float(progress), animated: true)
        timeLabel.text = "\(minutes)m remaining"
        if elapsedTime >= duration {
            timer?.invalidate()
            timer = nil
            let vc = storyboard?.instantiateViewController(withIdentifier: "TimeOutViewController") as! TimeOutViewController
            ResultViewModel.shared.getResult { (sucess, error) in
                print("hgcvkjtyu")
                if sucess! {
                    DispatchQueue.main.async
                    {
                        self.navigationController?.pushViewController(vc, animated: true)
                    }

                }
                    
            }

        }
    }
    
    @IBAction func leftMoveClicked(_ sender: Any) {
        let visibleItems: NSArray = self.collectionView.indexPathsForVisibleItems as NSArray
        let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
        let nextItem: IndexPath = IndexPath(item: currentItem.item - 1, section: 0)
        if nextItem.row >= 0{
            if nextItem.row < viewModel.questionsWithOptionList.count {
                self.collectionView.scrollToItem(at: nextItem, at: .left, animated: true)
                self.questionCountsLabel.text = String(nextItem.row + 1) +  " " + "of" + " " + String(viewModel.questionsWithOptionList.count) + " " + "question"
            }
        }
        
    }
    
    @IBAction func rightMoveClicked(_ sender: Any) {
        let visibleItems: NSArray = self.collectionView.indexPathsForVisibleItems as NSArray
        let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
        let nextItem: IndexPath = IndexPath(item: currentItem.item + 1, section: 0)
        if nextItem.row < viewModel.questionsWithOptionList.count {
            self.questionCountsLabel.text = String(nextItem.row + 1) +  " " + "of" + " " + String(viewModel.questionsWithOptionList.count) + " " + "question"
            self.collectionView.scrollToItem(at: nextItem, at: .right, animated: true)
        }
        if nextItem.row == viewModel.questionsWithOptionList.count{
            print(nextItem.row)
            if let vc = storyboard?.instantiateViewController(withIdentifier: "PopUpViewController") as? PopUpViewController {
                navigationController?.present(vc, animated: true, completion: nil)
                vc.delegate = self
            }
        }
        
    }
    
    @IBAction func cancelButtonClicked(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "QuestionListViewController") as? QuestionListViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    
          }
    
    @IBAction func questionsListButtonClicked(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "QuestionListViewController") as? QuestionListViewController {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension QuestionsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(viewModel.questionsWithOptionList.count)
        return viewModel.questionsWithOptionList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QuestionsCollectionViewCell", for: indexPath) as? QuestionsCollectionViewCell else {return QuestionsCollectionViewCell()}
        print( viewModel.questionsWithOptionList[indexPath.row].questionName)
        cell.currentQuestionID = viewModel.questionsWithOptionList[indexPath.row].questionId
        print(viewModel.questionsWithOptionList[indexPath.row].questionId, "question id")
        // cell.currentTestID = viewModel.questionsWithOptionList[indexPath.row].testId
        cell.currentTestID = 429
        cell.currentLessonID = 31
        cell.question.text = viewModel.questionsWithOptionList[indexPath.row].questionName
        cell.optionA.setTitle(viewModel.questionsWithOptionList[indexPath.row].option1, for: .normal)
        cell.optionB.setTitle(viewModel.questionsWithOptionList[indexPath.row].option2, for: .normal)
        cell.optionC.setTitle(viewModel.questionsWithOptionList[indexPath.row].option3, for: .normal)
        cell.optionD.setTitle(viewModel.questionsWithOptionList[indexPath.row].option4, for: .normal)
        cell.defaultButtonBorderText()
        cell.curentIndex = indexPath.row
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let noOfCellsInRow = 1
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left + flowLayout.sectionInset.right + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
        let size = (collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow)
        return CGSize(width: size, height: 700)
    }
    
}

extension QuestionsViewController: pushtoNextVc{
    
    func push() {
        let vc = storyboard?.instantiateViewController(identifier: "ResultViewController") as? ResultViewController
        vc?.assignLabels()
        navigationController?.pushViewController(vc!, animated: true)
    }
}
