//
//  TestViewController.swift
//  i-LeanAppAssessment
//
//  Created by Niveditha Naik on 12/12/22.
//

import UIKit

class TestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var testimage: [UIImage] = [#imageLiteral(resourceName: "btn_signin-1"),#imageLiteral(resourceName: "btn_signin-2"),#imageLiteral(resourceName: "btn_signin")]
    var testLbl = ["Animal Nutrion:  Feeding in Aves","Balanced Diet","Food Test"]
    var descriptionLbl = ["You have 40 minutes to answer all 50 questions. For each right ans 5 marks." ,"Balanced Diet","Food Test"]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testLbl.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TestTableViewCell
        cell.customizeView()
        cell.beginTestButton.layer.cornerRadius = 12
        cell.testImage.image = testimage[indexPath.row]
        cell.testTitleLbl.text =  testLbl[indexPath.row]
        cell.descriptionLabel.text = descriptionLbl[indexPath.row]
        return cell
    }
    


}
