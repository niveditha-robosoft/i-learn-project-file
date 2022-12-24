//
//  ViewController.swift
//  SearchResultScreen
//
//  Created by Shrushti Shetty on 07/12/22.
//

import UIKit

class SearchResultViewController: UIViewController {
    @IBOutlet weak var searchView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchView.layer.cornerRadius = 14.0
        
    }
    @IBAction func backtoHomeScreen(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func goBackToHomeScreen(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    

}

