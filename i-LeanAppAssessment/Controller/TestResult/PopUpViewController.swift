//
//  PopUpViewController.swift
//  i-LeanAppAssessment
//
//  Created by Shrushti Shetty on 19/12/22.
//

import Foundation
import UIKit

protocol pushtoNextVc {
    func push()
}
class PopUpViewController: UIViewController {
    
    @IBOutlet weak var designView: UIView!
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var yes: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var popViewHeight: NSLayoutConstraint!
    var testId: Int?
    var lessonId: Int?
    var delegate : pushtoNextVc?
    var viewModel: ResultViewModel? = ResultViewModel.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designView.layer.borderWidth = 3
        designView.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        popUpView.layer.cornerRadius = 20
        popUpView.layer.shadowOffset = CGSize(width: 0, height: -5)
    }
    
    @IBAction func yesButtonTpped(_ sender: UIButton) {
        print("YES TAPPED")
        dismiss(animated: true, completion: nil)
        ResultViewModel.shared.getResult { (sucess, error) in
            print("hgcvkjtyu")
            if sucess! {
                
            }
            DispatchQueue.main.async {
                self.delegate?.push()
            }
        }
    }
    
    @IBAction func noButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil )
    }
}

