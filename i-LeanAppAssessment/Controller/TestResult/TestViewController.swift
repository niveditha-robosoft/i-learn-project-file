//
//  TestViewController.swift
//  TestresultViewController
//
//  Created by Niveditha Naik on 08/12/22.
//

import Foundation
import UIKit

class TestViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var objOfTestViewModel = TestViewModel.shared
    
    var testimage: [UIImage] = [#imageLiteral(resourceName: "img_bird"),#imageLiteral(resourceName: "imgpsh_fullsize_anim"),#imageLiteral(resourceName: "imgpsh_fullsize_anim (1)")]
    
    var testTitleLbl: UILabel!
    
    var descriptionLbl: UILabel!
     
    var lessonIdIs = 0
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        objOfTestViewModel.lessonIdToSend = lessonIdIs
        tableView.delegate = self
        tableView.dataSource = self
    }
    func showAlertToCompleteUnit(message: String) {
            var msg = String(message.split(separator: ":").last ?? "undefined error")
            msg.remove(at: msg.index(before: msg.endIndex))
            let alert = UIAlertController(title: "Alert", message: msg.capitalized, preferredStyle: .alert)
            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(cancel)
            self.present(alert, animated: true, completion: nil)
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(TestViewModel.shared.testList.count)
        return TestViewModel.shared.testList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TestTableViewCell
        cell.customizeView()
        cell.beginTestButton.layer.cornerRadius = 12
        cell.testLevels.text = TestViewModel.shared.testList[indexPath.row].level
        cell.testTitleLbl.text =  "\(TestViewModel.shared.testList[indexPath.row].testName):\n\(TestViewModel.shared.testList[indexPath.row].lessonName)"
        cell.generateDescription(duration: TestViewModel.shared.testList[indexPath.row].duration, numberOfQuestion: TestViewModel.shared.testList[indexPath.row].totalQuestions, marks: TestViewModel.shared.testList[indexPath.row].marks)
        cell.index = indexPath
        cell.delegate = self
        return cell
    }
}

extension TestViewController: beginTest {
   
    func testBegin(index: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "QuestionsViewController") as? QuestionsViewController else {print("vc error");return}
        print(objOfTestViewModel.testList[index.row].testId)
        print(index.row,"index row")
        print("testId",TestViewModel.shared.testList[index.row].testId)
        vc.viewModel.fetchQuestions(key: "testId", value: objOfTestViewModel.testList[index.row].testId) { [self] (data, error) in
            DispatchQueue.main.async{
                if data! {
                }
                print("data",vc.viewModel.questionsWithOptionList.count)
                vc.testId = objOfTestViewModel.testList[index.row].testId
                vc.lessonId = objOfTestViewModel.lessonIdToSend
                vc.viewModel.lessonId = objOfTestViewModel.lessonIdToSend
                vc.viewModel.testId = objOfTestViewModel.testList[index.row].testId
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}

