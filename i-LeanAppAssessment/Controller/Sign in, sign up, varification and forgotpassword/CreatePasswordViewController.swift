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
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmPAsswordTextField: UITextField!
    
    var mobile_EmailToSend = ""
    
    var enteredCreatePassword = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.resetPasswordButton.layer.cornerRadius = 5.0
        resetPasswordButton.isEnabled = false
        resetPasswordButton.alpha = 0.5
       
        print("load data", mobile_EmailToSend)
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
        
        var condition = isValidPassword(pass1: newPasswordTextField.text ?? "")
        
        if condition == true{
            
            enteredCreatePassword = newPasswordTextField.text ?? ""
//                print("Strong password is been created")
        }else{
            enteredCreatePassword = ""
            
            self.alertMessage(message: "Create a strong password")
            
        }
        
        
        if confirmPAsswordTextField.text == enteredCreatePassword{
            
            print("Api call", mobile_EmailToSend)
            
            print("#####",mobile_EmailToSend,"*******",enteredCreatePassword)
            
            
            objectOfCreatePasswordViewModel.sendResetPasswordDataToApi(mobile_EmaildataToSend: mobile_EmailToSend, newPasswordToSend: enteredCreatePassword){ reponcedata in
                
                print("))))))))))))))))))$$$$$$$$$$$$$$$$$$$$$",reponcedata)
                if reponcedata == true{
                    
                    let HomeVc = self.storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") as? TabBarViewController
                    
                    if let vc = HomeVc {
                        
                        self.navigationController?.pushViewController(vc, animated: true)
                        
                    }
                    
                    
                } else if reponcedata == false{
                    
                    self.alertMessage(message: "New password is same as Old password")
                    
                }else{
                    
                    
                }
                
                
            }
   
            
        }else{
            
            self.alertMessage(message: "New password and confirmed password is not matching")
            
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
    
    func alertMessage(message: String){
        
            let alert = UIAlertController(title: "ALERT", message: message, preferredStyle: .alert)
        
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
            self.present(alert,animated: true, completion: nil)
        }
    
}
