//
//  TestViewController.swift
//  TestresultViewController
//
//  Created by Niveditha Naik on 08/12/22.
//

import UIKit

class TestViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var objectOfUserDefaults = UserDefaults()
    var aboutSubjectVM = AboutSUbjectViewModel.objectOfAboutSUbjectViewModel
    var objectOfKeyChain = KeyChain()
    var vm = AboutSUbjectViewModel.objectOfAboutSUbjectViewModel

    var chapterId:Int?
    var lessonId: Int?
    var testimage: [UIImage] = [#imageLiteral(resourceName: "img_bird"),#imageLiteral(resourceName: "imgpsh_fullsize_anim"),#imageLiteral(resourceName: "imgpsh_fullsize_anim (1)")]
    var testTitleLbl: UILabel!
    var descriptionLbl: UILabel!
        
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(chapterId,"PrintchapterId")
        vm.fetchTestDetails(tokenToSenf: self.getToken(), lessonIdToSend: AboutSUbjectViewModel.objectOfAboutSUbjectViewModel.currentChapterId) { (data) in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
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
        return vm.testDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TestTableViewCell
        cell.customizeView()
        cell.beginTestButton.layer.cornerRadius = 12
        cell.testLevels.text = vm.lessonDetails[indexPath.row].level
        cell.testTitleLbl.text =  "\(vm.testDetails[indexPath.row].testName):\n\( aboutSubjectVM.lessonDetails[indexPath.section].lessonName)"
        cell.index = indexPath
        cell.testId = vm.testDetails[indexPath.row].testId
        print("testID", vm.testDetails[indexPath.row].testId)
        cell.lessonId = aboutSubjectVM.lessonDetails[indexPath.section].lessonId
        print("lessonIDFinal",aboutSubjectVM.lessonDetails[indexPath.section].lessonId )
        cell.generateDescription(duration: vm.testDetails[indexPath.row].duration, numberOfQuestion: vm.testDetails[indexPath.row].totalQuestions, marks: vm.testDetails[indexPath.row].marks)
        cell.delegate = self
        return cell
    }
}

extension TestViewController: beginTest {
    func testBegin(index: IndexPath, testId: Int) {
        print("testID2", vm.testDetails[index.row].testId)
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "QuestionsViewController") as? QuestionsViewController else {print("vc error");return}
        //vc.lessonId = lessonId
        vc.lessonId = AboutSUbjectViewModel.objectOfAboutSUbjectViewModel.currentLessonId
        vc.testId = testId
        AboutSUbjectViewModel.objectOfAboutSUbjectViewModel.currentTestId = testId
        vc.viewModel.fetchQuestions(key: "testId", value: AboutSUbjectViewModel.objectOfAboutSUbjectViewModel.currentTestId) { [self] (message,statusCode,data, error) in
            if statusCode != 200 {
                DispatchQueue.main.async {showAlertToCompleteUnit(message: message)}
                return
            }
            DispatchQueue.main.async{
                if data! {
                }
                print("data",vc.viewModel.questionsWithOptionList.count)
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
    func getToken() -> String {
        var id = ""
       let userIdIs = objectOfUserDefaults.value(forKey: "userId")
        if let idIs = userIdIs as? Int{
            id = String(idIs)
        }
        print("stored user id : \(id)")
        guard let receivedTokenData = objectOfKeyChain.loadData(userId: id) else {print("2")
            return ""}
        guard let receivedToken = String(data: receivedTokenData, encoding: .utf8) else {print("3")
            return ""}
        print("token",receivedToken)
        return receivedToken
    }
}
