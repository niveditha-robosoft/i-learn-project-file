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
    
   
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var yes: customPopupButton!
    @IBOutlet weak var noButton: customPopupButton!
    @IBOutlet weak var popViewHeight: NSLayoutConstraint!
    var testId: Int?
    var lessonId: Int?
    var delegate : pushtoNextVc?
    var viewModel: ResultViewModel? = ResultViewModel.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        popUpView.layer.cornerRadius = 20
        popUpView.layer.shadowOffset = CGSize(width: 0, height: -5)
        yes.deselect()
        noButton.deselect()
    }
    
    @IBAction func yesButtonTpped(_ sender: UIButton) {
        yes.selected()
        noButton.deselect()
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
        yes.deselect()
        noButton.selected()
        self.dismiss(animated: true, completion: nil )
    }
}

