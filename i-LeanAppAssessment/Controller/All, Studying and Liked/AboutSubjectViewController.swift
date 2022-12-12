//
//  AboutSubjectViewController.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 11/12/22.
//

import UIKit

class AboutSubjectViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    var imageis: [UIImage] = [#imageLiteral(resourceName: "img_geography"), #imageLiteral(resourceName: "imgpsh_fullsize_anim (1)"), #imageLiteral(resourceName: "imgpsh_fullsize_anim (2)"), #imageLiteral(resourceName: "imgpsh_fullsize_anim (2)"), #imageLiteral(resourceName: "imgpsh_fullsize_anim (1)"), #imageLiteral(resourceName: "btn_signin-2"), #imageLiteral(resourceName: "logo_ilearn")]
    var chapName = ["padya","chapter","shahiri","animals","intigration","cell","HCl"]

    var lessonNameIs = ["naannu","neenu","avnu","ivnu"]
    var lessonNumber = ["Lesson 1","Lesson 2","Lesson 3","Lesson 4"]
        
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        tableView.delegate = self
        tableView.dataSource = self

        tableView.isHidden = true
        // Do any additional setup after loading the view.
    }
    

}


extension AboutSubjectViewController{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageis.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AboutSubjectCollectionViewCell
        cell.image.image = imageis[indexPath.row]
        cell.labelText.text = chapName[indexPath.row]
        cell.backView.layer.masksToBounds = true
        cell.backView.layer.cornerRadius = 15.0
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        tableView.isHidden = false
    }
    
    
    
}


extension AboutSubjectViewController: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 152 , height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
}

extension AboutSubjectViewController{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessonNumber.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! AboutSubjectTableViewCell
        
        cell.lessonName.text = lessonNameIs[indexPath.row]
        cell.lessonNumber.text = lessonNumber[indexPath.row]
        
        cell.chapterOneName.text = "santhosh"
        cell.chapterOneDescription.text = "coder"
        
        cell.chapterTwoName.text = "Harsha"
        cell.chapterTwoDescription.text = "learner"
        
        cell.chapterThreeName.text = "prajwal"
        cell.chapterThreeDescription.text = "DJ boss"
        
        cell.chapterFourName.text = "niveditha"
        cell.chapterFourDescription.text = "I don't know what to say;)"
        
        
        cell.backView.layer.masksToBounds = true
        cell.backView.layer.cornerRadius = 15.0
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVc = self.storyboard?.instantiateViewController(withIdentifier: "LessonTestViewController") as? LessonTestViewController
        
        if let vc = detailsVc {
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
     
    }
    
}
