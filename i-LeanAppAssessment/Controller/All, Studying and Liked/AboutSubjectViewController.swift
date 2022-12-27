//
//  AboutSubjectViewController.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 11/12/22.
//

import UIKit

class AboutSubjectViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {
    
    var objectOfUserDefaults = UserDefaults()
    var objectOfKeyChain = KeyChain()
    var chapterId: Int?
    var backgroundColour: [CGColor] = [#colorLiteral(red: 0.8352941176, green: 0.9450980392, blue: 0.8980392157, alpha: 1),#colorLiteral(red: 1, green: 0.9215686275, blue: 0.7098039216, alpha: 1),#colorLiteral(red: 1, green: 0.6745098039, blue: 0.6431372549, alpha: 1),#colorLiteral(red: 0, green: 0.4666666667, blue: 0.4235294118, alpha: 1),#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1),#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1),#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1),#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1),#colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1),#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1),#colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1),#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1),#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1),#colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1),#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1),#colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1),#colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1),#colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1),#colorLiteral(red: 0.5058823824, green: 0.3372549117, blue: 0.06666667014, alpha: 1),#colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1),#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1),#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1),#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)]

    var objectOfAboutSUbjectViewModel = AboutSUbjectViewModel.objectOfAboutSUbjectViewModel
        
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    var x2 = 0
    var subIdIs = 0
    var subjectNameIs = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true

        collectionView.delegate = self
        collectionView.dataSource = self
        
        tableView.delegate = self
        tableView.dataSource = self

        tableView.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        callApi()

    }
    
    func callApi() {
        if x2 == 1{
            
            collectionView.reloadData()
            
        }else{
           
            let loader =   self.loader()
            objectOfAboutSUbjectViewModel.callApiForSubjectdetails(subjectIdToSend: subIdIs){ condition in
                
                DispatchQueue.main.async() {
                    self.stopLoader(loader: loader)
                    if condition == true{
                        
                        self.collectionView.reloadData()
                    }else{
                        DispatchQueue.main.async {
                            self.alertMessage(message: "Ooops no data found related to this subject pleace try later ...!!!")
                        }
       
                    }
                }
                
                
            }
            
        }
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
        
        let call = getToken()
        
        if call != "" {
            
            let loader =   self.loader()
            objectOfAboutSUbjectViewModel.callApiForLessonDetails(tokenToSenf: call, lessonIdToSend: objectOfAboutSUbjectViewModel.subjectDetailsArray[indexPath.row].chapterId){ completionResponce in
                
                DispatchQueue.main.async() {
                    self.stopLoader(loader: loader)
                    if completionResponce == true{
                        
                        self.tableView.reloadData()
                        self.tableView.isHidden = false
                        
                    }else{
                        
                        DispatchQueue.main.async {
                            self.alertMessage(message: "Error while loaing the data try after some time ...!!!")
                        }

                    }
                }
       
            }
            
        }else{
            
            let refreshAlert = UIAlertController(title: "ALERT", message: "You are not loged in to tha application to access the all features of the app SIGN IN first", preferredStyle: UIAlertController.Style.alert)

                    refreshAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in

                        
                        self.objectOfUserDefaults.set(1, forKey: "SignInStatus")
                        
                        self.navigationController?.popToRootViewController(animated: true)
                        print("Handle Ok logic here")

                    }))



                    refreshAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in

                          print("Handle Cancel Logic here")

                    }))



                    present(refreshAlert, animated: true, completion: nil)
            
            
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
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
                
        return objectOfAboutSUbjectViewModel.lessonDetails.count

    }
    
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        

        return objectOfAboutSUbjectViewModel.lessonDetails[section].unitDetails.count 
    }
    
   
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
            let cell01 = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as? AboutHeaderCell
        
        
            if let cell = cell01{
    
                cell.progressPercentage(value: objectOfAboutSUbjectViewModel.lessonDetails[section].percentage)
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
        
        cell002.setRadious(x: objectOfAboutSUbjectViewModel.lessonDetails[indexPath.section].unitDetails[indexPath.row].completeStatus)
        cell002.chapterOneName.text = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.section].unitDetails[indexPath.row].unitName.capitalized
        cell002.chapterOneDescription.text = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.section].unitDetails[indexPath.row].unitOverview.capitalized
                        return cell002


    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailsVc = self.storyboard?.instantiateViewController(withIdentifier: "LessonTestViewController") as? LessonTestViewController

        
        if let vc = detailsVc {
            vc.finalLessonId = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.section].lessonId
            print(vc.finalLessonId,"is it taking lessonID for particular lesson")
            objectOfAboutSUbjectViewModel.currentLessonId = vc.finalLessonId ?? 0
            vc.lessonNameIs = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.section].lessonName
            vc.lessonNumberIs = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.section].lessonNumber
            vc.unitDetails = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.section].unitDetails
            vc.subjectNameIs = subjectNameIs
//            vc.realLessonId = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.section].lessonId
//            print(vc.realLessonId,"reallessonID")
            vc.realLessonId = AboutSUbjectViewModel.objectOfAboutSUbjectViewModel.lessonDetails[indexPath.row].lessonId
            print("is api data coming here", AboutSUbjectViewModel.objectOfAboutSUbjectViewModel.lessonDetails[indexPath.section].lessonId)
            objectOfAboutSUbjectViewModel.currentLessonId = objectOfAboutSUbjectViewModel.lessonDetails[indexPath.section].lessonId
            print(objectOfAboutSUbjectViewModel.currentLessonId,"currentlessonid")

            vc.lessonId = objectOfAboutSUbjectViewModel.subjectDetailsArray[indexPath.row].chapterId
            objectOfAboutSUbjectViewModel.currentLessonVC = vc
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

extension AboutSubjectViewController{
    
    func getToken() -> String {
        
        var id = ""
       let userIdIs = objectOfUserDefaults.value(forKey: "userId")
        
        if let idIs = userIdIs as? Int{
            
            id = String(idIs)
            
        }
        print("stored user id : \(id)")

        
        guard let receivedTokenData = objectOfKeyChain.loadData(userId: id) else {print("2")
            return ""}

        guard let receivedToken = String(data: receivedTokenData, encoding: .utf8) else {print("3")
            return ""}
        
        print("token",receivedToken)
        
        return receivedToken
    }
    
}
