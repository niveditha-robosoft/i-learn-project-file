//
//  CellContainerViewController.swift
//  i-LeanAppAssessment
//
//  Created by Niveditha Naik on 14/12/22.
//

import UIKit

class CellContainerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView002: UITableView!
    
    var name = ["bio", "maths", "science", "chemistry" ]
    var discription = ["bio bio", "calculation", "ajksdgh", "H2O"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView002.dequeueReusableCell(withIdentifier: "cell1") as! CellContainerTableViewCell
        
        cell.nameIs.text = name[indexPath.row]
        cell.discriptionIs.text = discription[indexPath.row]
        return cell
    }
    

}
