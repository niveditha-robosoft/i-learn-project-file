//
//  LessonDetailsViewController.swift
//  i-LeanAppAssessment
//
//  Created by Niveditha Naik on 15/12/22.
//

import UIKit
import AVKit
class LessonDetailsViewController: UIViewController {
    
    var userId = 0
    var subjectId = 0
    var chapterId = 0
    var lessonId = 0
    var unitId = 0

    var subName = ""
    var chapName = ""
    var lessonName = ""
    var unitName = ""
    
    var pageIdIs = 0
    
    // var  objectFromLessonViewModel = LessonViewModel()
    var objectOfUserCurrentlyStudyingDataViewMOdel = UserCurrentlyStudyingDataViewMOdel.objectOfViewModel
    var objectOfLessonViewModel = LessonDetailViewModel.objectOfLessonDetailViewModel
    var objectOFSignInViewMOdel = SignInViewModel.objectOfViewModel
    
    var objectOfAboutSUbjectViewModel = AboutSUbjectViewModel.objectOfAboutSUbjectViewModel
    var player: AVPlayer!
    var avpController = AVPlayerViewController()
    
    var objectOfUserDefaults = UserDefaults()
    var objectOfKeyChain = KeyChain()
    
    var numarr = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
    
    var lessonNum = ""
    
    var currentPageNo = 1
    var SelectedCellLabel = 0
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
    @IBOutlet weak var contentViewHeight: NSLayoutConstraint!
    @IBOutlet weak var videoHeight: NSLayoutConstraint!
    @IBOutlet weak var unitvideoDetailIs: UIView!
    @IBOutlet weak var unitDetailImageIs: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var buttonMain: UIButton!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var imageViewHeight: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let id =  objectOfUserDefaults.value(forKey: "userId") as? Int{
            
            userId = id
        }
        
        leftButton.isEnabled = false
        
        self.objectOfLessonViewModel.videoIs.removeAll()
        self.objectOfLessonViewModel.photoIs.removeAll()
        
        self.bottomView.layer.cornerRadius = 20
        self.bottomView.clipsToBounds = true
        
        self.buttonMain.layer.cornerRadius = 10
        self.buttonMain.clipsToBounds = true
        collectionView.delegate = self
        collectionView.dataSource = self
        DispatchQueue.main.async { [self] in
            for i in self.objectOfLessonViewModel.lessonDetail{
                
                pageIdIs = i.pageId
                
                if i.isLiked == "liked"{
                    
                    self.likeButton.setImage(#imageLiteral(resourceName: "Path Copy"), for: .normal)
                }else{
                    
                    self.likeButton.setImage(#imageLiteral(resourceName: "icn_like"), for: .normal)
                    
                }
                
                if (self.lessonNum == "LessonNo 1"){
                    self.unitTitleLabel.text = "L1:\(i.pageTitle)"
                    
                }
                else if(self.lessonNum == "LessonNo 2") {
                    self.unitTitleLabel.text = "L2:\(i.pageTitle)"
                    
                }
                else if(self.lessonNum == "LessonNo 3") {
                    self.unitTitleLabel.text = "L3:\(i.pageTitle)"
                    
                }
                else{
                    self.unitTitleLabel.text = "L4:\(i.pageTitle)"
                }
                             
                        if i.unitImage != ""{

                    self.imageViewHeight.constant = 197
                    self.unitDetailImageIs.image = self.getImage(urlString: i.unitImage)
                
                    self.videoHeight.constant = 0
                  
                    self.contentViewHeight.priority = UILayoutPriority(rawValue: 1000)
                }

                else {

                    self.imageViewHeight.constant = 0

                    self.startVideo(videoString: i.unitVideo)
                
                    self.videoHeight.constant = 200
                    self.contentViewHeight.priority = UILayoutPriority(rawValue: 750)


                }


                if  i.unitVideo != "" {
                    

                
                    self.imageViewHeight.constant = 0
                    self.videoHeight.constant = 0

                }
                else {


                    self.imageViewHeight.constant = 0
                    self.videoHeight.constant = 0

                }
               
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
        
        
        let loader = self.loader()
        
        let tokenIs = getToken()

        print("sending page id : \(pageIdIs)")

        
        objectOfLessonViewModel.likedLessonDetailsToSend(tokenToSend: tokenIs, unitIdToSend: pageIdIs){ status in
            DispatchQueue.main.async() {
                self.stopLoader(loader: loader)

                if status == true{

                    self.likeButton.setImage(#imageLiteral(resourceName: "Path Copy"), for: .normal)

                }else{

                    self.likeButton.setImage(#imageLiteral(resourceName: "icn_like"), for: .normal)

                }

            }

        }
 
        
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
    
    
    func disableRightButton() {
        
        if currentPageNo >= totalePages{
            userDataSendingFunction()

            let userData = CurrentlyStudyingData(subjectName: subName, chapterName: chapName, lessonName: lessonName, unitName: unitName)
            
            objectOfUserCurrentlyStudyingDataViewMOdel.studying.append(userData)
            
            rightButton.isEnabled = false
            leftButton.isEnabled = true
        }else{
            
            rightButton.isEnabled = true
            leftButton.isEnabled = true

        }
    }
    
    func disableLeftButton() {
        
        if currentPageNo >= 1{
            

            rightButton.isEnabled = true
            leftButton.isEnabled = true
        }else{
            
            rightButton.isEnabled = false
            leftButton.isEnabled = true

        }
        
        if currentPageNo == 1{
            
            leftButton.isEnabled = false
        }else{
            
            leftButton.isEnabled = true

        }
        
    }
    
    @IBAction func rightButtonTapped(_ sender: Any) {
        
//        print("userId : \(userId)\nsubjectId : \(subjectId)\nchapterId : \(chapterId)\nlessonId :\(lessonId)\nunitId : \(unitId)")
        
        
        
        
        let tokenIs = getToken()
        self.objectOfLessonViewModel.videoIs.removeAll()
        self.objectOfLessonViewModel.photoIs.removeAll()

        currentPageNo += 1
        

        if currentPageNo <= totalePages{
            

            let loader = self.loader()
            objectOfLessonViewModel.callForLessonDetail(URLString: "https://app-e-learning-221207163844.azurewebsites.net/user/view/unitDetails?unitId=\(unitId)&limit=1&page=\(currentPageNo)", tokenTOSend: tokenIs){ [self] data in

                DispatchQueue.main.async() {
                    self.stopLoader(loader: loader)

                    print("api responce is : \(data)")
                    if data == true{

                        print("api responce is and if loop in side : \(data)")
                        if  objectOfLessonViewModel.lessonDetail.last?.unitImage != ""{


                            self.imageViewHeight.constant = 197
                            self.unitDetailImageIs.image = getImage(urlString: objectOfLessonViewModel.lessonDetail.last?.unitImage ?? "")
                            self.videoHeight.constant = 0
                            self.unitvideoDetailIs.isHidden = false
                           

                        }else{


                            self.imageViewHeight.constant = 0
                            self.videoHeight.constant = 0

                        }

                        if objectOfLessonViewModel.lessonDetail.last?.unitVideo != ""{


                            self.imageViewHeight.constant = 0
                            startVideo(videoString: objectOfLessonViewModel.lessonDetail.last?.unitVideo ?? "")
                            self.videoHeight.constant = 200


                        }else{


                            self.imageViewHeight.constant = 0
                            self.videoHeight.constant = 0


                        }


                        self.pageIdIs = self.objectOfLessonViewModel.lessonDetail.last?.pageId ?? 0


                        self.titleLabel.text = self.objectOfLessonViewModel.lessonDetail.last?.pageTitle
                        self.contentTextView.text = self.objectOfLessonViewModel.lessonDetail.last?.unitDescription
                        self.unitDetailImageIs.image = UIImage( contentsOfFile: objectOfLessonViewModel.lessonDetail.last!.unitImage)
                        self.currentPage.text = "\(self.currentPageNo) of \(self.totalePages) pages"
                    

                    }else{

                        DispatchQueue.main.async {

                            alertMessage(message: "Sorry somthing went wrong unable to fetch data try after some time ...!!!")


                        }



                    }

                }

            }

            disableRightButton()

        }else{

            alertMessage(message: "Error while loading the data ...!!!")
        }
        
   
    }
    
    
    func userDataSendingFunction()  {
        
        let tokenIs = getToken()
        objectOfUserCurrentlyStudyingDataViewMOdel.sendUserdata(token: tokenIs, userId: userId, subjectId: subjectId, chapterId: chapterId, lessonId: lessonId, unitId: unitId){ status in
            
            if status == true{
                
                print("trure")
            }else{
                
                print("false")
            }
            
        }
        
        
        
    }
    
    @IBAction func leftButtonTapped(_ sender: Any) {
        
        let tokenIs = getToken()
        self.objectOfLessonViewModel.videoIs.removeAll()
        self.objectOfLessonViewModel.photoIs.removeAll()
       
        currentPageNo -= 1
        
        if currentPageNo != 0 {
            
            let loader = self.loader()
           
           
            objectOfLessonViewModel.callForLessonDetail(URLString: "https://app-e-learning-221207163844.azurewebsites.net/user/view/unitDetails?unitId=\(unitId)&limit=1&page=\(currentPageNo)", tokenTOSend: tokenIs){ data in
                
                DispatchQueue.main.async() {
                    self.stopLoader(loader: loader)
                    
                    if data == true{
                                             
                        if self.objectOfLessonViewModel.lessonDetail.last?.unitImage != ""{

                         

                            self.unitvideoDetailIs.isHidden = true
                            self.imageViewHeight.constant = 197
                            self.unitDetailImageIs.image = self.getImage(urlString: self.objectOfLessonViewModel.lessonDetail.last?.unitImage ?? "")
                          
                            self.videoHeight.constant = 0




                        }else{
                           
                           
                            self.imageViewHeight.constant = 0
                            self.videoHeight.constant = 0


                        }

                        if self.objectOfLessonViewModel.lessonDetail.last?.unitVideo != ""{


                            self.imageViewHeight.constant = 0
                            self.startVideo(videoString: self.objectOfLessonViewModel.lessonDetail.last?.unitVideo ?? "")
                            self.videoHeight.constant = 200


                        }else{


                            self.imageViewHeight.constant = 0
                            self.videoHeight.constant = 0


                        }



                        
                        self.pageIdIs = self.objectOfLessonViewModel.lessonDetail.last?.pageId ?? 0
                        
                        self.titleLabel.text = self.objectOfLessonViewModel.lessonDetail.last?.pageTitle
                        self.contentTextView.text = self.objectOfLessonViewModel.lessonDetail.last?.unitDescription
                        
                        self.currentPage.text = "\(self.currentPageNo) of \(self.totalePages) pages"
                        
                        
                    }else{
                        
                        DispatchQueue.main.async {
                            self.alertMessage(message: "Sorry somthing went wrong unable to fetch data try after some time ...!!!")
                        }
                    }
                }
            }
            disableLeftButton()
        }else{
            
            alertMessage(message: "Error while loading the data ...!!!")
        }
        
        
        
        
        
        
        
    }
    
    
    
    
    
    @IBAction func okButtontapped(_ sender: UIButton) {
        self.objectOfLessonViewModel.videoIs.removeAll()
        self.objectOfLessonViewModel.photoIs.removeAll()
        let tokenIs = getToken()
        
        currentPageNo = SelectedCellLabel
        let loader = self.loader()
        
        if SelectedCellLabel == totalePages{
            
            userDataSendingFunction()

            
        }

        objectOfLessonViewModel.callForLessonDetail(URLString: "https://app-e-learning-221207163844.azurewebsites.net/user/view/unitDetails?unitId=\(unitId)&limit=1&page=\(String(SelectedCellLabel))", tokenTOSend: tokenIs){ data in
            DispatchQueue.main.async() {
                self.stopLoader(loader: loader)

            if data == true {


                if self.objectOfLessonViewModel.lessonDetail.last?.unitImage != "" {
                 
                    self.unitvideoDetailIs.isHidden = true
                    self.imageViewHeight.constant = 197
                    self.unitDetailImageIs.image = self.getImage(urlString: self.objectOfLessonViewModel.lessonDetail.last?.unitImage ?? "")
                    self.videoHeight.constant = 0
                   self.unitvideoDetailIs.isHidden = true
                    self.unitDetailImageIs.isHidden = false
                    self.contentViewHeight.priority = UILayoutPriority(rawValue: 1000)

                }else{

                   self.unitvideoDetailIs.isHidden = true
                    self.imageViewHeight.constant = 0
                    self.videoHeight.constant = 0
                    self.unitDetailImageIs.isHidden = true

                    self.contentViewHeight.priority = UILayoutPriority(rawValue: 750)


                }

                if self.objectOfLessonViewModel.lessonDetail.last?.unitVideo != ""{


                    self.imageViewHeight.constant = 0
                    self.startVideo(videoString: self.objectOfLessonViewModel.lessonDetail.last?.unitVideo ?? "")
                    self.videoHeight.constant = 200
                    self.unitvideoDetailIs.isHidden = false
                    self.unitDetailImageIs.isHidden = true
                }else{

                   // self.unitDetailImageIs.isHidden = false
                    self.imageViewHeight.constant = 0
                    self.videoHeight.constant = 0
                      self.unitvideoDetailIs.isHidden = true
                    self.unitDetailImageIs.isHidden = true



                }


                self.titleLabel.text = self.objectOfLessonViewModel.lessonDetail.last?.pageTitle
                self.contentTextView.text = self.objectOfLessonViewModel.lessonDetail.last?.unitDescription
                self.unitDetailImageIs.image = UIImage( contentsOfFile: self.objectOfLessonViewModel.lessonDetail.last!.unitImage)
            }else{

                DispatchQueue.main.async {
                    self.alertMessage(message: "Sorry somthing went wrong unable to fetch data try after some time ...!!!")
                }

            }
            }
        }
        self.heightConstraint.constant = 0
        self.currentPage.text = "\(self.SelectedCellLabel) of \(self.totalePages) pages"
        
    }
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.heightConstraint.constant = 0
        okButton.isEnabled = false
        cancelButton.isEnabled = false
        collectionView.isHidden = true
    }
}
extension LessonDetailsViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalePages
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BottomUpCollectionViewCell
        cell.numberLabel.text = String(numarr[indexPath.row])
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        SelectedCellLabel = indexPath.row + 1
        
        
    }
}
extension LessonDetailsViewController{
    func getImage(urlString: String) -> UIImage {
        
        guard let imageUrl = URL(string: urlString) else { return  #imageLiteral(resourceName: "almond") }
                
        let imageData = try?
            
            Data(contentsOf: imageUrl)
                
        if let imageData = imageData{

            guard let image = UIImage(data: imageData) else { return  #imageLiteral(resourceName: "almond") }
            
            
            return image
            
        }
        return  #imageLiteral(resourceName: "almond")
    }
    
    func startVideo(videoString: String){
        if let url = URL(string: videoString){
            player = AVPlayer(url:url)
            avpController.player = player
            self.addChild(avpController)
            avpController.view.frame = self.unitvideoDetailIs.bounds
            self.unitvideoDetailIs.addSubview(avpController.view)
        }
        
    }
}

extension LessonDetailsViewController{
    
    func getToken() -> String {
        
        var id = ""
        let userIdIs = objectOfUserDefaults.value(forKey: "userId")
        
        if let idIs = userIdIs as? Int{
            id = String(idIs)
        }
        guard let receivedTokenData = objectOfKeyChain.loadData(userId: id) else {print("2")
            return ""}
        
        guard let receivedToken = String(data: receivedTokenData, encoding: .utf8) else {print("3")
            return ""}
                
        return receivedToken
    }

    
}
