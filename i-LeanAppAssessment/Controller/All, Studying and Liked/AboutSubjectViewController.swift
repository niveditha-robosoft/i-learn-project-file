//
//  AboutSubjectViewController.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 11/12/22.
//

import UIKit

class AboutSubjectViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    var imageis: [UIImage] = [#imageLiteral(resourceName: "img_geography"), #imageLiteral(resourceName: "imgpsh_fullsize_anim (1)"), #imageLiteral(resourceName: "imgpsh_fullsize_anim (2)"), #imageLiteral(resourceName: "imgpsh_fullsize_anim (2)"), #imageLiteral(resourceName: "imgpsh_fullsize_anim (1)"), #imageLiteral(resourceName: "btn_signin-2"), #imageLiteral(resourceName: "logo_ilearn")]
    var backgroundColour: [CGColor] = [#colorLiteral(red: 0.8352941176, green: 0.9450980392, blue: 0.8980392157, alpha: 1),#colorLiteral(red: 1, green: 0.9215686275, blue: 0.7098039216, alpha: 1),#colorLiteral(red: 1, green: 0.6745098039, blue: 0.6431372549, alpha: 1),#colorLiteral(red: 0, green: 0.4666666667, blue: 0.4235294118, alpha: 1),#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1),#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)]

    var objectOfAboutSUbjectViewModel = AboutSUbjectViewModel.objectOfViewmodel
        
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    var subIdIs = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loader =   self.loader()
        objectOfAboutSUbjectViewModel.callApiForSubjectdetails(subjectIdToSend: subIdIs){ condition in
            
            DispatchQueue.main.async() {
                self.stopLoader(loader: loader)
                if condition == true{
                    
                    self.collectionView.reloadData()
                }else{
                    
                }
            }
            
            
        }
        
        
        
        
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
        
        let loader =   self.loader()
        objectOfAboutSUbjectViewModel.callApiForLessonDetails(lessonIdToSend: objectOfAboutSUbjectViewModel.subjectDetailsArray[indexPath.row].chapterId){ completionResponce in
            
            DispatchQueue.main.async() {
                self.stopLoader(loader: loader)
                if completionResponce == true{
                    
                    self.tableView.reloadData()
                    self.tableView.isHidden = false
                    
                }else{
                    

                }
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
        return objectOfAboutSUbjectViewModel.lessonDetails.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
            return objectOfAboutSUbjectViewModel.lessonDetails.count

    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
            let cell01 = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as? AboutHeaderCell
            
            if let cell = cell01{
    
                cell.imageIS.image = #imageLiteral(resourceName: "img_pp-1")
                cell.lessonname.text = objectOfAboutSUbjectViewModel.lessonDetails[section].lessonName
                cell.lessonNumber.text = objectOfAboutSUbjectViewModel.lessonDetails[section].lessonNumber
                return cell

            
        }
        
        return nil

    
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell002 = tableView.dequeueReusableCell(withIdentifier: "cell") as! AboutSubjectTableViewCell
        
                    cell002.chapterOneName.text = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.section].unitDetails[indexPath.row].unitName
                    cell002.chapterOneDescription.text = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.section].unitDetails[indexPath.row].unitOverview
                        return cell002


    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVc = self.storyboard?.instantiateViewController(withIdentifier: "LessonTestViewController") as? LessonTestViewController

        
        if let vc = detailsVc {
            vc.lessonNameIs = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.section].lessonName
            vc.lessonNumberIs = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.section].lessonNumber
            vc.unitDetails = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.section].unitDetails

            self.navigationController?.pushViewController(vc, animated: true)

       }
     
    }
    
}
