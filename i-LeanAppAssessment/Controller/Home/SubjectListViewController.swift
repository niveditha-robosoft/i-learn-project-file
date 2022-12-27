//
//  ViewController.swift
//  SubjectsViewController
//
//  Created by Niveditha Naik on 07/12/22.
//

import UIKit

class SubjectListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var image: [UIImage] = [ #imageLiteral(resourceName: "img_geography"),#imageLiteral(resourceName: "imgpsh_fullsize_anim"),#imageLiteral(resourceName: "icn_search"),#imageLiteral(resourceName: "img_searchresultnotfound"),#imageLiteral(resourceName: "btn_cancel"),#imageLiteral(resourceName: "btn_signin-3"),#imageLiteral(resourceName: "btn_signin-1") ,#imageLiteral(resourceName: "icn_search-1"), #imageLiteral(resourceName: "img_ilearn_logo_main")]
   
    var objectOfSubjectViewModel = SubjectListViewModel.objectOfViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        callApi()

    }

    
    override func viewDidAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    func callApi() {
        let loader =   self.loader()
        objectOfSubjectViewModel.subjectDetail(){ condition in
            
            DispatchQueue.main.async() {
                self.stopLoader(loader: loader)
                if condition == true {
                    self.tableView.reloadData()
                }
                else{
                    self.alertMessage(message: "Error while loading the data try after some time ...!!!")
                }
            }

        }
    }
    
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    print("count is is : \(objectOfSubjectViewModel.subjectListDetail.count)")
    return objectOfSubjectViewModel.subjectListDetail.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! subjectsTableViewCell
    cell.customizeCardView()
    

    cell.subjectlabel.text = objectOfSubjectViewModel.subjectListDetail[indexPath.row].subjectName
    cell.subjectImage.image = self.getImage(urlString: objectOfSubjectViewModel.subjectListDetail[indexPath.row].subjectImage)
    return cell
}
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                
        let detailsVc = self.storyboard?.instantiateViewController(withIdentifier: "SubjectDetailsViewController") as? SubjectDetailsViewController
        
        if let vc = detailsVc {
            
            vc.subjectIdFromSUbjectlist = objectOfSubjectViewModel.subjectListDetail[indexPath.row].subjectId
            vc.subjectNameToSend = objectOfSubjectViewModel.subjectListDetail[indexPath.row].subjectName
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
     
    }
    
    
    func getImage(urlString: String) -> UIImage {
        
        guard let imageUrl = URL(string: urlString) else { return #imageLiteral(resourceName: "img_geography") }
        
        let imageData = try?
        Data(contentsOf: imageUrl)
        
        if let imageData = imageData{
            
            guard let image = UIImage(data: imageData) else { return #imageLiteral(resourceName: "img_geography-1") }
            
            return image
        }
        
        return #imageLiteral(resourceName: "img_geography-1")
        
    }

    
    
}
