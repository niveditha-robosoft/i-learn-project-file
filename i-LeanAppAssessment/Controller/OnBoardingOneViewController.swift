//
//  OnBoardingOneViewController.swift
//  i-LeanAppAssessment
//
//  Created by Niveditha Naik on 06/12/22.
//

import UIKit

class OnBoardingOneViewController: UIViewController {
    
    @IBOutlet weak var collectioView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var getStartedLabel: UILabel!
    

    
    var slide: [OnBoardingSlide] = []
    var currentpage = 0 {
        didSet {
            //            pageControl.currentPage = currentpage
            if currentpage == slide.count - 1 {
                getStartedLabel.text = "Get Started"
            }
            else{
                getStartedLabel.text = ""
            }
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationController?.navigationBar.isHidden = true
        
        
        slide = [OnBoardingSlide(title: "Learn from anywhere", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", image: #imageLiteral(resourceName: "imgpsh_fullsize_anim")),OnBoardingSlide(title: "user friendly", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", image: #imageLiteral(resourceName: "imgpsh_fullsize_anim (1)")),OnBoardingSlide(title: "study overView", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", image: #imageLiteral(resourceName: "imgpsh_fullsize_anim (2)"))]
        
        collectioView.delegate = self
        collectioView.dataSource = self
        
    }
    
    
    @IBAction func nextbuttonClicked(_ sender: UIButton) {
        print(11)
        if currentpage == slide.count - 1 {
            
            let vc = storyboard?.instantiateViewController(identifier: "SignInViewController") as! SignInViewController
             navigationController?.pushViewController(vc, animated: true)
        }else{
            currentpage += 1
            
            pageControl.currentPage = currentpage
            
            self.collectioView.contentOffset.x += collectioView.frame.width
            
            
            
            UIView.animate(withDuration: 0.2, delay: 0, options: UIView.AnimationOptions.curveEaseOut, animations: {
                
                self.view.layoutIfNeeded()
                
                
                
            }, completion: nil)
            
        }
    }
    
    
}
extension OnBoardingOneViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(25)
        return slide.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(11111)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnBoardinCollectionViewCell.identifier, for: indexPath) as! OnBoardinCollectionViewCell
        cell.setup(slide[indexPath.row])
        cell.delegate = self
        
        if indexPath.row == 2
        {
            cell.skipbutton.isHidden = true
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       // return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        

        let noOfCellsInRow = 1   //number of column you want
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            
            + flowLayout.sectionInset.right
            
            + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
        let size = (collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow)
        return CGSize(width: collectionView.frame.width , height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        currentpage = Int(scrollView.contentOffset.x / width)
        pageControl.currentPage = currentpage
    }
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        print("transition")
//    coordinator.animate(alongsideTransition: nil) { (context) -> Void in
//
//                self.collectioView.reloadData()
//
//            }
//    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate(alongsideTransition: nil) { (context) in
            self.collectioView.reloadData()
        }
    }
}



extension OnBoardingOneViewController: goToLogInscreen{
    func go() {
        
        let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        self.navigationController?.pushViewController(vc2, animated: true)
    }
    
    
}
