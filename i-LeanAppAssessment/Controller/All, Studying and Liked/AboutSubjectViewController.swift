//
//  AboutSubjectViewController.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 11/12/22.
//

import UIKit

class AboutSubjectViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    
//    private let tableView: UITableView = {
//        
//        let table = UITableView(frame: .zero, style: .grouped)
//        
//        
//        return table
//    }()
   
   
    
    var objectOfAboutSUbjectViewModel = AboutSUbjectViewModel.objectOfViewmodel
    
    var imageis: [UIImage] = [#imageLiteral(resourceName: "img_geography"), #imageLiteral(resourceName: "imgpsh_fullsize_anim (1)"), #imageLiteral(resourceName: "imgpsh_fullsize_anim (2)"), #imageLiteral(resourceName: "imgpsh_fullsize_anim (2)"), #imageLiteral(resourceName: "imgpsh_fullsize_anim (1)"), #imageLiteral(resourceName: "btn_signin-2"), #imageLiteral(resourceName: "logo_ilearn")]
    var backgroundColour: [CGColor] = [#colorLiteral(red: 0.8352941176, green: 0.9450980392, blue: 0.8980392157, alpha: 1),#colorLiteral(red: 1, green: 0.9215686275, blue: 0.7098039216, alpha: 1),#colorLiteral(red: 1, green: 0.6745098039, blue: 0.6431372549, alpha: 1),#colorLiteral(red: 0, green: 0.4666666667, blue: 0.4235294118, alpha: 1),#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1),#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)]

    var dataisis = ["bio", "mathas", "pgysics"]
    var dataits = ["1", "2", "3", "4", "5"]
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    
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
        
        print("HI" )
        
//        self.tableView.reloadData()
//        self.tableView.isHidden = false
        
        objectOfAboutSUbjectViewModel.callApiForLessonDetails(lessonIdToSend: objectOfAboutSUbjectViewModel.subjectDetailsArray[indexPath.row].chapterId){ completionResponce in
            
            print("Hi HI HI ")
            if completionResponce == true{
                print("HI true" )
                
                self.tableView.reloadData()
                self.tableView.isHidden = false
                
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
   
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//            return objectOfAboutSUbjectViewModel.lessonDetails.count
//
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! AboutSubjectTableViewCell
//
//            cell.lessonName.text = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.row].lessonName
//            cell.lessonNumber.text = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.row].lessonNumber
//
//    //        cell.chapterOneName.text = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.row].unitDetails[indexPath.row].unitName
//    //        cell.chapterOneDescription.text = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.row].unitDetails[indexPath.row].unitOverview
//    //
//    //        cell.chapterTwoName.text = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.row].unitDetails[indexPath.row].unitName
//    //        cell.chapterTwoDescription.text = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.row].unitDetails[indexPath.row].unitOverview
//    //
//    //        cell.chapterThreeName.text = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.row].unitDetails[indexPath.row].unitName
//    //        cell.chapterThreeDescription.text = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.row].unitDetails[indexPath.row].unitOverview
//    //
//    //        cell.chapterFourName.text = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.row].unitDetails[indexPath.row].unitName
//    //        cell.chapterFourDescription.text = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.row].unitDetails[indexPath.row].unitOverview
//
//            cell.addUnitDetails(data: objectOfAboutSUbjectViewModel.lessonDetails[indexPath.row].unitDetails)
//
//            cell.backView.layer.masksToBounds = true
//            cell.backView.layer.cornerRadius = 15.0
//
//        return cell
//
//    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let detailsVc = self.storyboard?.instantiateViewController(withIdentifier: "LessonTestViewController") as? LessonTestViewController
//
//        if let vc = detailsVc {
//
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
//
//    }
    
}


extension AboutSubjectViewController{
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 3
//    }
//
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 4
//    }
//
//
//
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 72.0))
//        header.backgroundColor = .white
//
//        let imageView = UIImageView(image: #imageLiteral(resourceName: "round"))
//
//        header.addSubview(imageView)
//        imageView.frame = CGRect(x: 2, y: 15, width: header.frame.size.height - 30, height: header.frame.size.height - 30)
//
//        let lable1 = UILabel(frame: CGRect(x: 15 + imageView.frame.size.width , y: 29 , width: header.frame.size.width - 15 - imageView.frame.size.width, height: header.frame.size.height - 58))
//
//        header.addSubview(lable1)
//
////        for i in objectOfAboutSUbjectViewModel.lessonDetails{
////
////
////            for j in 0...i.lessonName.count{
////
////                lable1.text = i.lessonName
////
////            }
////
////        }
////
//
//
//
//            lable1.text = objectOfAboutSUbjectViewModel.lessonDetails[section].lessonName
//
//
//
//
//        lable1.font = .systemFont(ofSize: 12, weight: .medium)
//        return header
//    }
//
//
//    viewforsection
//
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 72.0
//    }
//
//
//
//
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//
//        cell.textLabel?.text = "Hi: section: \(indexPath.section) | row: \(indexPath.row)"
//
//        cell.textLabel = UILabel(c)
//        return cell
//    }
//
    
    
    
}



extension AboutSubjectViewController{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//            return dataits.count
            print("number    : ", objectOfAboutSUbjectViewModel.lessonDetails.count)
            return objectOfAboutSUbjectViewModel.lessonDetails.count
        
       

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
//            return dataisis.count
            return objectOfAboutSUbjectViewModel.lessonDetails.count

    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
            let cell01 = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as? AboutHeaderCell
            
            if let cell = cell01{
    
                cell.imageIS.image = #imageLiteral(resourceName: "round")
                cell.lessonname.text = objectOfAboutSUbjectViewModel.lessonDetails[section].lessonName
                cell.lessonNumber.text = objectOfAboutSUbjectViewModel.lessonDetails[section].lessonNumber
                return cell
    
            
            
//            if let cell = cell01{
//
//                cell.imageIS.image = #imageLiteral(resourceName: "round")
//                cell.lessonname.text = dataisis[section]
//                cell.lessonNumber.text = "12345678"
//                cell.headerBackgroundView.layer.cornerRadius = 12.0
//                return cell
//            }
//
            
        }
        
        return nil

    
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell002 = tableView.dequeueReusableCell(withIdentifier: "cell") as! AboutSubjectTableViewCell
        
                    cell002.chapterOneName.text = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.section].unitDetails[indexPath.row].unitName
                    cell002.chapterOneDescription.text = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.section].unitDetails[indexPath.row].unitOverview
                        return cell002
                        
                    
//                    cell002.chapterOneName.text = dataits[indexPath.row]
//                    cell002.chapterOneDescription.text = "iuytrert"
//
//                    return cell002
        
           

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVc = self.storyboard?.instantiateViewController(withIdentifier: "LessonTestViewController") as? LessonTestViewController
//
//        print("")
//
//        print("lesson name : \(objectOfAboutSUbjectViewModel.lessonDetails[indexPath.section].lessonName)\ndetails :		 \(objectOfAboutSUbjectViewModel.lessonDetails[indexPath.section].unitDetails)")
//
//        print("")
        
        if let vc = detailsVc {
            vc.lessonNameIs = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.section].lessonName
            vc.lessonNumberIs = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.section].lessonNumber
            vc.unitDetails = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.section].unitDetails

            self.navigationController?.pushViewController(vc, animated: true)

       }
     
    }
    }
    
    
    

