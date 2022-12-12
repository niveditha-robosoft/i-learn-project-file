//
//  ViewController.swift
//  SearchResultScreen
//
//  Created by Shrushti Shetty on 07/12/22.
//

import UIKit

class SearchResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func backtoHomeScreen(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    

}

