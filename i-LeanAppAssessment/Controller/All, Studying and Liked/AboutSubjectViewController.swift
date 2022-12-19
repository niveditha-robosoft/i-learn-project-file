//
//  AboutSubjectViewController.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 11/12/22.
//

import UIKit

class AboutSubjectViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    var imageis: [UIImage] = [#imageLiteral(resourceName: "img_geography"), #imageLiteral(resourceName: "imgpsh_fullsize_anim (1)"), #imageLiteral(resourceName: "imgpsh_fullsize_anim (2)"), #imageLiteral(resourceName: "imgpsh_fullsize_anim (2)"), #imageLiteral(resourceName: "imgpsh_fullsize_anim (1)"), #imageLiteral(resourceName: "btn_signin-2"), #imageLiteral(resourceName: "logo_ilearn")]
    var backgroundColour: [CGColor] = [#colorLiteral(red: 0.8352941176, green: 0.9450980392, blue: 0.8980392157, alpha: 1),#colorLiteral(red: 1, green: 0.9215686275, blue: 0.7098039216, alpha: 1),#colorLiteral(red: 1, green: 0.6745098039, blue: 0.6431372549, alpha: 1),#colorLiteral(red: 0, green: 0.4666666667, blue: 0.4235294118, alpha: 1),#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1),#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1),#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1),#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1),#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1),#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1),#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1),#colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1),#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)]

    var objectOfAboutSUbjectViewModel = AboutSUbjectViewModel.objectOfViewmodel
        
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    var subIdIs = 0
    var subjectNameIs = ""
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
        cell.image.image = getImage(urlString: objectOfAboutSUbjectViewModel.subjectDetailsArray[indexPath.row].chapterImage)
        cell.labelText.text = objectOfAboutSUbjectViewModel.subjectDetailsArray[indexPath.row].chapterName
        cell.imageBackgroundView.layer.backgroundColor = backgroundColour[indexPath.row]
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
    
                cell.progressPercentage(value: 10)
                cell.progressInitiate()
                cell.setTopTwoCornerRadius()
                cell.lessonname.text = objectOfAboutSUbjectViewModel.lessonDetails[section].lessonName.uppercased()
                cell.lessonNumber.text = objectOfAboutSUbjectViewModel.lessonDetails[section].lessonNumber.capitalized
                return cell

            
        }
        
        return nil

    
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell002 = tableView.dequeueReusableCell(withIdentifier: "cell") as! AboutSubjectTableViewCell
        
        cell002.setRadious(x: 1)
        cell002.chapterOneName.text = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.section].unitDetails[indexPath.row].unitName.capitalized
        cell002.chapterOneDescription.text = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.section].unitDetails[indexPath.row].unitOverview.capitalized
//        cell002.setTopTwoCornerRadius()
                        return cell002


    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVc = self.storyboard?.instantiateViewController(withIdentifier: "LessonTestViewController") as? LessonTestViewController

        
        if let vc = detailsVc {
            vc.lessonNameIs = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.section].lessonName
            vc.lessonNumberIs = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.section].lessonNumber
            vc.unitDetails = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.section].unitDetails
            vc.subjectName = subjectNameIs
            self.navigationController?.pushViewController(vc, animated: true)

       }
     
    }
    
    
    func getImage(urlString: String) -> UIImage {
        
        guard let imageUrl = URL(string: urlString) else { return #imageLiteral(resourceName: "360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws") }
        
        let imageData = try?
        Data(contentsOf: imageUrl)
        
        if let imageData = imageData{
            
            guard let image = UIImage(data: imageData) else { return #imageLiteral(resourceName: "360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws") }
            
            return image
        }
        
        return #imageLiteral(resourceName: "360_F_346839683_6nAPzbhpSkIpb8pmAwufkC7c5eD7wYws")
        
    }
    
}
