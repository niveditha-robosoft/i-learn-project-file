//
//  LessonTestViewController.swift
//  i-LeanAppAssessment
//
//  Created by Niveditha Naik on 12/12/22.
//

import UIKit

class LessonTestViewController: UIViewController {
    
    var lessonVc :LessonViewController?
    
    var lessonNameIs = ""
    var lessonNumberIs = ""
    var unitDetails = [UnitModel]()
    var subjectName = ""
    @IBOutlet weak var lessonButton: CustomButton!
    @IBOutlet weak var subjectIntroduction: UILabel!
    
    @IBOutlet weak var testButton: CustomButton!
    @IBOutlet weak var wrongButton: UIButton!
    @IBOutlet weak var testContainerView: UIView!
    @IBOutlet weak var lessonContainerView: UIView!
    
    @IBOutlet weak var lessonName: UILabel!
    @IBOutlet weak var lessonNumber: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subjectIntroduction.text = "INTRODUCTION TO \(subjectName.uppercased())"
        testContainerView.isHidden = true
        lessonContainerView.isHidden = false
       
        lessonButton.setTitleColor(#colorLiteral(red: 0.2980392157, green: 0.5764705882, blue: 1, alpha: 1), for: .normal)
        testButton.setTitleColor(#colorLiteral(red: 0.5568627451, green: 0.5607843137, blue: 0.5764705882, alpha: 1), for: .normal)
        lessonButton.roundCorners(corners: [.bottomLeft,.topLeft], radius: 12)
        testButton.roundCorners(corners: [.bottomRight,.topRight], radius: 12)

        lessonName.text = lessonNameIs
        lessonNumber.text = lessonNumberIs
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let vc = segue.destination as? LessonViewController{
            vc.unitDetailsIS = unitDetails
        }

        }

    @IBAction func lessonButtonTapped(_ sender: Any) {
        testContainerView.isHidden = true
        lessonContainerView.isHidden = false
        lessonButton.setTitleColor(#colorLiteral(red: 0.2274509804, green: 0.4980392157, blue: 0.9058823529, alpha: 1), for: .normal)
        testButton.setTitleColor(#colorLiteral(red: 0.5568627451, green: 0.5607843137, blue: 0.5764705882, alpha: 1), for: .normal)
        view.bringSubviewToFront(lessonContainerView)
         
    }
    

    @IBAction func testButtonTapped(_ sender: Any) {
        
        testContainerView.isHidden = false
        lessonContainerView.isHidden = true
        lessonButton.setTitleColor(#colorLiteral(red: 0.6250110865, green: 0.6290901303, blue: 0.6430234909, alpha: 1), for: .normal)
        testButton.setTitleColor(#colorLiteral(red: 0.3614955544, green: 0.654981792, blue: 1, alpha: 1), for: .normal)
//        wrongButton.setImage(#imageLiteral(resourceName: "btn_back-1"), for: .normal)
        
        view.bringSubviewToFront(testContainerView)
    }
   
    @IBAction func backButton(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
}
