//
//  LessonTestViewController.swift
//  i-LeanAppAssessment
//
//  Created by Niveditha Naik on 12/12/22.
//
import UIKit
import Foundation
class LessonTestViewController: UIViewController {
    var likedUnitId = 0
    var likedSubject = ""
    var likedLessonNUmber = ""
    var likedLessonName = ""
    var likedLessonId = 0
    var statusXY = 0
    
    
    var subjectName1 = ""
    var chapterName1 = ""
    var lessonName1 = ""
    var lessonId = 0
    
    var userId1 = 0
    var subjectId1 = 0
    var chapterId1 = 0
    var lessonId1 = 0
    
    
    
    var lessonVc :LessonViewController?
    var lessonNameIs = ""
   // var lessonId:Int?
    var lessonNumberIs = ""
    //var realLessonId: Int?
    //var finalLessonId: Int?
    
    var unitDetails = [UnitModel]()
    
    var subjectNameIs = ""
    @IBOutlet weak var lessonButton: CustomButton!
    @IBOutlet weak var subjectName: UILabel!
    
    @IBOutlet weak var testButton: CustomButton!
    @IBOutlet weak var wrongButton: UIButton!
    @IBOutlet weak var testContainerView: UIView!
    @IBOutlet weak var lessonContainerView: UIView!
    
    var isLessonShown = true
    
    var testVc: TestViewController?
    @IBOutlet weak var lessonName: UILabel!
    
    @IBOutlet weak var lessonNumber: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isLessonShown{
            testButton.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
            lessonButton.setTitleColor(#colorLiteral(red: 0.3614955544, green: 0.654981792, blue: 1, alpha: 1), for: .normal)
            testContainerView.isHidden = true
            lessonContainerView.isHidden = false
            view.bringSubviewToFront(lessonContainerView)
        }
        else{
            lessonButton.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
            testButton.setTitleColor(#colorLiteral(red: 0.3614955544, green: 0.654981792, blue: 1, alpha: 1), for: .normal)
            testContainerView.isHidden = false
            lessonContainerView.isHidden = true
            view.bringSubviewToFront(testContainerView)
        }
        
        subjectName.text = "INTRODUCTION TO \(subjectNameIs.uppercased())"
        lessonName.text = lessonNameIs.capitalized
        lessonNumber.text = lessonNumberIs
        testButton.setTitleColor(#colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), for: .normal)
        lessonButton.setTitleColor(#colorLiteral(red: 0.3614955544, green: 0.654981792, blue: 1, alpha: 1), for: .normal)
        testContainerView.isHidden = true
        lessonContainerView.isHidden = false
        view.bringSubviewToFront(lessonContainerView)
        getTestByLesson()
        lessonButton.roundCorners(corners: [.bottomLeft,.topLeft], radius: 12)
        testButton.roundCorners(corners: [.bottomRight,.topRight], radius: 12)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        testVc = segue.destination as? TestViewController
       // testVc?.lessonIdIs = lessonId
        testVc?.lessonIdIs = lessonId1
        lessonVc = segue.destination as? LessonViewController
        
        lessonVc?.likedLessonName = likedLessonName
        lessonVc?.likedLessonIdIdIs = likedLessonId
        lessonVc?.statusX = statusXY
        lessonVc?.likedUnitIdIs = likedUnitId
        
        
        lessonVc?.subjectName2 = subjectName1
        lessonVc?.chapterName2 = chapterName1
        lessonVc?.lessonName2 = lessonName1
        lessonVc?.userId2 = userId1
        lessonVc?.subjectId2 = subjectId1
        lessonVc?.chapterId2 = chapterId1
        lessonVc?.lessonId2 = lessonId1
        lessonVc?.unitDetailsIS = unitDetails
        //        testVc?.lessonId = self.realLessonId
        //        testVc?.chapterId = self.lessonId
        //        AboutSUbjectViewModel.objectOfAboutSUbjectViewModel.currentChapterId = self.lessonId ?? 0
    }
    func getTestByLesson(){
        TestViewModel.shared.fetchTestQuestions(key: TestViewModel.shared.testByLessonKey, value: TestViewModel.shared.testByLessonValue) { (test, error) in
            print(TestViewModel.shared.testList)
            
        }
    }
    func getQuestions(){
        TestViewModel.shared.fetchTestQuestions(key: TestViewModel.shared.questionKey, value: TestViewModel.shared.questionValue) { (test, error) in
            
        }
    }

    @IBAction func lessonButtonTapped(_ sender: Any) {
        showLesson()
    }
    
    @IBAction func testButtonTapped(_ sender: Any) {
        showTest()
    }
    
    func showTest() {
        testContainerView.isHidden = false
        lessonContainerView.isHidden = true
        lessonButton.setTitleColor(#colorLiteral(red: 0.6250110865, green: 0.6290901303, blue: 0.6430234909, alpha: 1), for: .normal)
        testButton.setTitleColor(#colorLiteral(red: 0.3614955544, green: 0.654981792, blue: 1, alpha: 1), for: .normal)
        testVc?.tableView.reloadData()
        view.bringSubviewToFront(testContainerView)
    }
    
    func showLesson() {
        testContainerView.isHidden = true
        lessonContainerView.isHidden = false
        lessonButton.setTitleColor(#colorLiteral(red: 0.3614955544, green: 0.654981792, blue: 1, alpha: 1), for: .normal)
        testButton.setTitleColor(#colorLiteral(red: 0.5568627451, green: 0.5607843137, blue: 0.5764705882, alpha: 1), for: .normal)
        lessonVc?.tableView.reloadData()
        view.bringSubviewToFront(lessonContainerView)
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
