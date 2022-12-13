//
//  AboutSubjectViewController.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 11/12/22.
//

import UIKit

class AboutSubjectViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    var objectOfAboutSUbjectViewModel = AboutSUbjectViewModel.objectOfViewmodel
    
    var imageis: [UIImage] = [#imageLiteral(resourceName: "img_geography"), #imageLiteral(resourceName: "imgpsh_fullsize_anim (1)"), #imageLiteral(resourceName: "imgpsh_fullsize_anim (2)"), #imageLiteral(resourceName: "imgpsh_fullsize_anim (2)"), #imageLiteral(resourceName: "imgpsh_fullsize_anim (1)"), #imageLiteral(resourceName: "btn_signin-2"), #imageLiteral(resourceName: "logo_ilearn")]
    var backgroundColour: [CGColor] = [#colorLiteral(red: 0.8352941176, green: 0.9450980392, blue: 0.8980392157, alpha: 1),#colorLiteral(red: 1, green: 0.9215686275, blue: 0.7098039216, alpha: 1),#colorLiteral(red: 1, green: 0.6745098039, blue: 0.6431372549, alpha: 1),#colorLiteral(red: 0, green: 0.4666666667, blue: 0.4235294118, alpha: 1),#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1),#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)]
  
 
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView001: UITableView!
    @IBOutlet weak var tableView002: UITableView!
    var subIdIs = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        objectOfAboutSUbjectViewModel.callApiForSubjectdetails(subjectIdToSend: subIdIs){ condition in
            
            if condition == true{
                
                self.collectionView.reloadData()
            }
            
        }
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        tableView001.delegate = self
        tableView001.dataSource = self

        tableView001.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    

}


extension AboutSubjectViewController{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
 
            return objectOfAboutSUbjectViewModel.subjectDetailsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AboutSubjectCollectionViewCell
        cell.image.image = imageis[indexPath.row]
        cell.labelText.text = objectOfAboutSUbjectViewModel.subjectDetailsArray[indexPath.row].chapterName
        cell.imageBackgroundView.backgroundColor = UIColor(cgColor: backgroundColour.randomElement() ?? .init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1))
        cell.backView.layer.masksToBounds = true
        cell.backView.layer.cornerRadius = 15.0
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("HI" )
        
        objectOfAboutSUbjectViewModel.callApiForLessonDetails(lessonIdToSend: objectOfAboutSUbjectViewModel.subjectDetailsArray[indexPath.row].chapterId){ completionResponce in
            
            print("Hi HI HI ")
            if completionResponce == true{
                print("HI true" )
                
                self.tableView001.reloadData()
                self.tableView001.isHidden = false
                
            }else{
                
                print("HI false" )
                
                
            }
            
        }
        
        
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
        
        switch tableView001 {
        
        case tableView001:
            return objectOfAboutSUbjectViewModel.lessonDetails.count
            
        case tableView002:
            return 4
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch tableView001 {
        case tableView001:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! AboutSubjectTableViewCell
            
            cell.lessonName.text = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.row].lessonName
            cell.lessonNumber.text = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.row].lessonNumber
            
    //        cell.chapterOneName.text = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.row].unitDetails[indexPath.row].unitName
    //        cell.chapterOneDescription.text = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.row].unitDetails[indexPath.row].unitOverview
    //
    //        cell.chapterTwoName.text = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.row].unitDetails[indexPath.row].unitName
    //        cell.chapterTwoDescription.text = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.row].unitDetails[indexPath.row].unitOverview
    //
    //        cell.chapterThreeName.text = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.row].unitDetails[indexPath.row].unitName
    //        cell.chapterThreeDescription.text = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.row].unitDetails[indexPath.row].unitOverview
    //
    //        cell.chapterFourName.text = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.row].unitDetails[indexPath.row].unitName
    //        cell.chapterFourDescription.text = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.row].unitDetails[indexPath.row].unitOverview
            
            cell.addUnitDetails(data: objectOfAboutSUbjectViewModel.lessonDetails[indexPath.row].unitDetails)
            
            cell.backView.layer.masksToBounds = true
            cell.backView.layer.cornerRadius = 15.0
            
            return cell
            
        case tableView002:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") as! AboutSubjectTableViewCell
            

            
            cell.chapterOneName.text = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.row].unitDetails[indexPath.row].unitName
            cell.chapterOneDescription.text = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.row].unitDetails[indexPath.row].unitOverview

            
           
            
            cell.backView.layer.masksToBounds = true
            cell.backView.layer.cornerRadius = 15.0
            
            return cell
            
            
        default:
            return UITableViewCell()
        }
        
        
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVc = self.storyboard?.instantiateViewController(withIdentifier: "LessonTestViewController") as? LessonTestViewController
        
        if let vc = detailsVc {
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
     
    }
    
}
