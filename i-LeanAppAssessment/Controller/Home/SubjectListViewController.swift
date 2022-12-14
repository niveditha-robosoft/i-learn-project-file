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
        tableView.delegate = self
        tableView.dataSource = self
        
        objectOfSubjectViewModel.subjectDetail(){ condition in
            if condition == true {
                self.tableView.reloadData()
            }
            else{
                
            }
            
        }
    }


func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return objectOfSubjectViewModel.subjectListDetail.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! subjectsTableViewCell
    cell.customizeCardView()
    cell.subjectlabel.text = objectOfSubjectViewModel.subjectListDetail[indexPath.row].subjectName
    cell.subjectImage.image = image[indexPath.row]
    return cell
}
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailsVc = self.storyboard?.instantiateViewController(withIdentifier: "SubjectDetailsViewController") as? SubjectDetailsViewController

        if let vc = detailsVc {
            print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!",objectOfSubjectViewModel.subjectListDetail[indexPath.row].subjectId)
            vc.subjectIdFromSUbjectlist = objectOfSubjectViewModel.subjectListDetail[indexPath.row].subjectId
            self.navigationController?.pushViewController(vc, animated: true)
        }
     
    }
    

    
    
}
