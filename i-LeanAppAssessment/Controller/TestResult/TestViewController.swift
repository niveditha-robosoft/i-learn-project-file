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
        print(index.row,"preetammm")
        print(789696,TestViewModel.shared.testList[index.row].testId)
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

//import UIKit
////protocol dismissVc {
////
////    func dismiss()
////
////    }
//
//
//class TestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//
//    var objectOfUserDefaults = UserDefaults()
//    var objectOfKeyChain = KeyChain()
//
//    var ObjectOfSignInVIewMOdel = SignInViewModel.objectOfViewModel
//    var vm = AboutSUbjectViewModel.objectOfAboutSUbjectViewModel
////    var objectOfLessonViewModel = LessonViewModel.objectOfviewModel
//
//    var objectOfAboutSUbjectViewModel = AboutSUbjectViewModel()
//    var testDetailsListArray = [Test]()
//    var objectOfSubjectListViewController = SubjectListViewModel.objectOfViewModel
//    var objectOfLessonViewModel = LessonViewModel()
//    var lessonDetails = [Lesson]()
//    //var lessonImg: [UIImage] = [#imageLiteral(resourceName: "MicrosoftTeams-image (6)"),#imageLiteral(resourceName: "MicrosoftTeams-image (5)"),#imageLiteral(resourceName: "MicrosoftTeams-image (7)"),#imageLiteral(resourceName: "MicrosoftTeams-image (6)"),#imageLiteral(resourceName: "MicrosoftTeams-image (5)"),#imageLiteral(resourceName: "MicrosoftTeams-image (7)"),#imageLiteral(resourceName: "MicrosoftTeams-image (6)"),#imageLiteral(resourceName: "MicrosoftTeams-image (5)"),#imageLiteral(resourceName: "MicrosoftTeams-image (6)"),#imageLiteral(resourceName: "MicrosoftTeams-image (5)"),#imageLiteral(resourceName: "MicrosoftTeams-image (7)")]
//    var levelLbl: UILabel!
//    var titleLabl : UILabel!
//    var descriptionLbl: UILabel!
//
//
//  //  var delegate: dismissVc?
//
//    @IBOutlet weak var tableView: UITableView!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.navigationController?.navigationBar.isHidden = true
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.reloadData()
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        objectOfAboutSUbjectViewModel.fetchTestDetails(tokenToSenf: self.getToken(), lessonIdToSend: AboutSUbjectViewModel.objectOfAboutSUbjectViewModel.currentChapterId) { (data) in
//            print(AboutSUbjectViewModel.objectOfAboutSUbjectViewModel.currentChapterId)
//            DispatchQueue.main.async {
//                print("shrushti",self.vm.testDetails.count)
//
//                self.tableView.reloadData()
//
//
//            }
//        }
//    }
//    func showAlertToCompleteUnit(message: String) {
//            var msg = String(message.split(separator: ":").last ?? "undefined error")
//            msg.remove(at: msg.index(before: msg.endIndex))
//            let alert = UIAlertController(title: "Alert", message: msg.capitalized, preferredStyle: .alert)
//            let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//            alert.addAction(cancel)
//            self.present(alert, animated: true, completion: nil)
//        }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        print("appeared", vm.testDetails.count)
//        return vm.testDetails.count
//    }
//
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//                let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TestTableViewCell
//                cell.customizeView()
//                cell.beginTestButton.layer.cornerRadius = 12
//                cell.testLevels.text = vm.lessonDetails[indexPath.row].level
//                cell.testTitleLbl.text =  "\(vm.testDetails[indexPath.row].testName):\n\( vm.lessonDetails[indexPath.section].lessonName)"
//                cell.index = indexPath
//                cell.finalTestId = vm.testDetails[indexPath.row].testId
//                AboutSUbjectViewModel.objectOfAboutSUbjectViewModel.currentTestId = vm.testDetails[indexPath.row].testId
//                print("finaTESTIDDDDDD",vm.testDetails[indexPath.row].testId)
//                print("cuurrentIDIS",AboutSUbjectViewModel.objectOfAboutSUbjectViewModel.currentTestId)
//               // cell.testId = vm.testDetails[indexPath.row].testId
//                print("testID", vm.testDetails[indexPath.row].testId)
//                cell.lessonId = vm.lessonDetails[indexPath.section].lessonId
//                print("lessonIDFinal",AboutSUbjectViewModel.objectOfAboutSUbjectViewModel.currentLessonId )
//                cell.generateDescription(duration: vm.testDetails[indexPath.row].duration, numberOfQuestion: vm.testDetails[indexPath.row].totalQuestions, marks: vm.testDetails[indexPath.row].marks)
//                cell.delegate = self
//                return cell
//            }
//
//}
//
//
//    extension TestViewController: beginTest {
//        func testBegin(index: IndexPath, testId: Int) {
//            print("testID2", vm.testDetails[index.row].testId)
//            guard let vc = storyboard?.instantiateViewController(withIdentifier: "QuestionsViewController") as? QuestionsViewController else {print("vc error");return}
//            //vc.lessonId = lessonId
//            //vc.lessonId = AboutSUbjectViewModel.objectOfAboutSUbjectViewModel.currentLessonId
//            vc.testId = vm.testDetails[index.row].testId
//            vc.viewModel.fetchQuestions(key: "testId", value: vm.testDetails[index.row].testId) { [self] (message,statusCode,data, error) in
//                if statusCode != 200 {
//                    DispatchQueue.main.async {showAlertToCompleteUnit(message: message)}
//                    return
//                }
//                DispatchQueue.main.async{
//                    if data! {
//                    }
//                    print("data",vc.viewModel.questionsWithOptionList.count)
//                    self.navigationController?.pushViewController(vc, animated: true)
//                }
//            }
//        }
//
//        func getToken() -> String {
//            var id = ""
//           let userIdIs = objectOfUserDefaults.value(forKey: "userId")
//            if let idIs = userIdIs as? Int{
//                id = String(idIs)
//            }
//            print("stored user id : \(id)")
//            guard let receivedTokenData = objectOfKeyChain.loadData(userId: id) else {print("2")
//                return ""}
//            guard let receivedToken = String(data: receivedTokenData, encoding: .utf8) else {print("3")
//                return ""}
//            print("token",receivedToken)
//            return receivedToken
//        }
//    }
