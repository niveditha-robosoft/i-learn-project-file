//
//  QuestionsListViewController.swift
//  i-LeanAppAssessment
//
//  Created by Shrushti Shetty on 14/12/22.
//

import Foundation
import UIKit

class QuestionListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var viewModel = QuestionListViewModel.shared
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backButtonToTestScreen: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.questionListArray.count
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.fetchQuestionList(key: "testId", value: 429) { [self] (data, error) in
            DispatchQueue.main.async{
                if data! {
                    print(viewModel.questionListArray.count,"apidata")
                    tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! QuestionListTableViewCell
        cell.question.text = viewModel.questionListArray[indexPath.row].questionName
        cell.questionNumber.text = "\(indexPath.row+1). "
        
        if viewModel.highlightIndex.contains(indexPath.row) {
            cell.question.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
            cell.questionNumber.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        }
        
        
        return cell
    }
    
    
    @IBAction func backButtonToTestClicked(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

