//
//  ViewController.swift
//  SearchResultScreen
//
//  Created by Shrushti Shetty on 07/12/22.
//

import UIKit

class SearchResultViewController: UIViewController {
    @IBOutlet weak var searchView: CustomSearchViewShadow!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchView.layer.cornerRadius = 14.0
        searchView.layer.shadowColor = UIColor(red: 76/255, green: 147/255, blue: 255/255, alpha: 0.05).cgColor
        searchView.layer.shadowOpacity = 100
        searchView.layer.shadowRadius = 5
        searchView.layer.shadowOffset = CGSize(width: 0, height: 2)
        
        
    }
    @IBAction func backtoHomeScreen(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func goBackToHomeScreen(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    

}

