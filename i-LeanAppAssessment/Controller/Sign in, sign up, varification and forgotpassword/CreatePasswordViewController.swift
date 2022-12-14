//
//  CreatePasswordViewController.swift
//  ForgotPassword
//
//  Created by Shrushti Shetty on 08/12/22.
//

import UIKit

class CreatePasswordViewController: UIViewController {
    
    var objectOfCreatePasswordViewModel = CreatePasswordViewModel.objrctOfViewModel
    
    @IBOutlet weak var resetPasswordButton: UIButton!
    @IBOutlet weak var newPasswordTextField: CustomeTextField!
    @IBOutlet weak var confirmPAsswordTextField: CustomeTextField!
    
    var mobile_EmailToSend = ""
    
    var enteredCreatePassword = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.resetPasswordButton.layer.cornerRadius = 5.0
        resetPasswordButton.isEnabled = false
        resetPasswordButton.alpha = 0.5
    }
    
    @IBAction func newPassword(_ sender: Any) {
        
        if newPasswordTextField.text != "" && confirmPAsswordTextField.text != ""{
            
            resetPasswordButton.isEnabled = true
            resetPasswordButton.alpha = 1.0
            
            
        }else{
            
            resetPasswordButton.isEnabled = false
            resetPasswordButton.alpha = 0.5
        }
        
    }
    
    @IBAction func confirmPassword(_ sender: Any) {
        
        if newPasswordTextField.text != "" && confirmPAsswordTextField.text != ""{
            
            resetPasswordButton.isEnabled = true
            resetPasswordButton.alpha = 1.0
            
            
        }else{
            
            resetPasswordButton.isEnabled = false
            resetPasswordButton.alpha = 0.5
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: Any) {
        
        print("reset butto tapped", mobile_EmailToSend)
        
        let condition = isValidPassword(pass1: newPasswordTextField.text ?? "")
        
        if condition == true{
            
            enteredCreatePassword = newPasswordTextField.text ?? ""
            
        }else{
            
            enteredCreatePassword = ""
            
            self.alertMessage(message: "Create a strong password")
            
        }
        
        
        if confirmPAsswordTextField.text == enteredCreatePassword{
            
            let loader =   self.loader()
            
            objectOfCreatePasswordViewModel.sendResetPasswordDataToApi(mobile_EmaildataToSend: mobile_EmailToSend, newPasswordToSend: enteredCreatePassword){ reponcedata in
                
                DispatchQueue.main.async() {
                    self.stopLoader(loader: loader)
                    
                    if reponcedata == true{
                        
                        let HomeVc = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as? SignInViewController
                        
                        if let vc = HomeVc {
                            
                            self.navigationController?.pushViewController(vc, animated: true)
                            
                        }
                        
                        
                    } else if reponcedata == false{
                        
                        DispatchQueue.main.async {
                            self.alertMessage(message: "New password is same as Old password")

                        }
                        
                    }else{
                        
                        
                    }
                }
  
            }
 
        }else{
            
            DispatchQueue.main.async {
                self.alertMessage(message: "New password and confirmed password is not matching")

            }
            
        }
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }

}


extension CreatePasswordViewController{
    
    public func isValidPassword(pass1: String) -> Bool {

            let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@#$%^&+=])[A-Za-z\\d$@$!%*?&#]{8,50}"

            return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: pass1)

        }

}
