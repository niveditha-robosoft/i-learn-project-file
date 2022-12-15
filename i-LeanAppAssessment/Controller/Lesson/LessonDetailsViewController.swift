//
//  LessonDetailsViewController.swift
//  i-LeanAppAssessment
//
//  Created by Niveditha Naik on 15/12/22.
//

import UIKit

class LessonDetailsViewController: UIViewController {
    var  objectFromLessonViewModel = LessonViewModel()
    var objectOfLessonViewModel = LessonDetailViewModel.objectOfLessonDetailViewModel
    var unitId = 0
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonMain: UIButton!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomView: UIView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        objectOfLessonViewModel.callForLessonDetail(lessonUnitSend: unitId) { condition in
            
            if condition == true{
                print("sdfsfgdsgdfgfgd",self.unitId)
                
            }
        }
        self.bottomView.layer.cornerRadius = 20
               self.bottomView.clipsToBounds = true
               
               self.buttonMain.layer.cornerRadius = 10
               self.buttonMain.clipsToBounds = true
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private var isBottomSheetShown = false
    @IBAction func goToPageButton(_ sender: Any) {
        if (isBottomSheetShown)
                {
                   
                    UIView.animate(withDuration: 0.1, animations: {
                        
                        self.heightConstraint.constant = 420
                        self.view.layoutIfNeeded()
                    }) { (status) in
                        self.isBottomSheetShown = false
                        
                        UIView.animate(withDuration: 0.1, animations: {
                            self.heightConstraint.constant = 0
                        
                            self.view.layoutIfNeeded()
                        }) { (status) in
                           
                        }
                     
                    }
                }
                else{
                  
                    
                    UIView.animate(withDuration: 0.1, animations: {
                        self.heightConstraint.constant = 420
                    
                        self.view.layoutIfNeeded()
                    }) { (status) in
                      
                        self.isBottomSheetShown = true
                        
                        UIView.animate(withDuration: 0.1, animations: {
                            self.heightConstraint.constant = 400
                            
                            self.view.layoutIfNeeded()
                        }) { (status) in
                            
                        }
                    }
                }
                
    }
    

}
extension LessonDetailsViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? BottomUpCollectionViewCell
        cell?.numberLabel.text = String(indexPath.row)
        return cell!
    }
}
