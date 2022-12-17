//
//  LessonDetailsViewController.swift
//  i-LeanAppAssessment
//
//  Created by Niveditha Naik on 15/12/22.
//

import UIKit

class LessonDetailsViewController: UIViewController {
   // var  objectFromLessonViewModel = LessonViewModel()
    var objectOfLessonViewModel = LessonDetailViewModel.objectOfLessonDetailViewModel
       
    var unitId = 0
    
    var currentPageNo = 1
    
    var totalePages = 0
    
    @IBOutlet weak var selectedPageLabel: UILabel!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var currentPage: UILabel!
    @IBOutlet weak var unitTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var unitDetailImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonMain: UIButton!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomView: UIView!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.bottomView.layer.cornerRadius = 20
               self.bottomView.clipsToBounds = true
               
               self.buttonMain.layer.cornerRadius = 10
               self.buttonMain.clipsToBounds = true
        collectionView.delegate = self
        collectionView.dataSource = self
        DispatchQueue.main.async {
            for i in self.objectOfLessonViewModel.lessonDetail{
                
                self.titleLabel.text = i.pageTitle
                self.contentTextView.text = i.unitDescription
                
                self.currentPage.text = "\(self.currentPageNo) of \(self.totalePages) pages"
            }
        }
       
        
        cancelButton.layer.borderColor = #colorLiteral(red: 0.2980392157, green: 0.5764705882, blue: 1, alpha: 1)
        cancelButton.layer.borderWidth = 2
        cancelButton.layer.cornerRadius = 13
        okButton.layer.cornerRadius = 13
        selectedPageLabel.text = "of \(totalePages) pages"
    }
    
    private var isBottomSheetShown = false
    
    @IBAction func likeButtonTapped(_ sender: Any) {
        
    }
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
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func rightButtonTapped(_ sender: Any) {
        print("button Clicked")
      
        currentPageNo += 1
        print("current page",currentPageNo)
        objectOfLessonViewModel.callForLessonDetail(URLString: "https://app-e-learning-221207163844.azurewebsites.net/user/view/unitDetails?unitId=\(407)&limit=1&page=\(currentPageNo)"){ data in
            
            if data == true{
                    
                self.titleLabel.text = self.objectOfLessonViewModel.lessonDetail.last?.pageTitle
                self.contentTextView.text = self.objectOfLessonViewModel.lessonDetail.last?.unitDescription
                self.currentPage.text = "\(self.currentPageNo) of \(self.totalePages) pages"
                //self.viewDidLoad()
                
            }else{
                
            }
            
        }
       
        
        
        
    }
    
    @IBAction func leftButtonTapped(_ sender: Any) {
      
        currentPageNo -= 1
        if currentPageNo != 0 {
            objectOfLessonViewModel.callForLessonDetail(URLString: "https://app-e-learning-221207163844.azurewebsites.net/user/view/unitDetails?unitId=\(407)_&limit=1&page=\(currentPageNo)"){ data in
                
                if data == true{
                   
                    self.titleLabel.text = self.objectOfLessonViewModel.lessonDetail.last?.pageTitle
                        self.contentTextView.text = self.objectOfLessonViewModel.lessonDetail.last?.unitDescription
                        
                    self.currentPage.text = "\(self.currentPageNo) of \(self.totalePages) pages"
                    
                    
                }else{
                    
                }
                
            }
        }else{
            
        }
      
        
        
        
    }
    
    @IBAction func okButtontapped(_ sender: Any) {
        
    }
}
extension LessonDetailsViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalePages
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? BottomUpCollectionViewCell
        cell?.numberLabel.text = String(indexPath.row)
        return cell!
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
