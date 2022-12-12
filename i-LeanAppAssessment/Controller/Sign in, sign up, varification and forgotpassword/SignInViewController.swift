//
//  SignInViewController.swift
//  i-LeanAppAssessment
//
//  Created by Shrushti Shetty on 06/12/22.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {
    
    var objectOfSignInViewModel = SignInViewModel.objectOfViewModel
    
    @IBOutlet weak var mobileEmailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var gotoHomeScreenWhenButtonTappedInSigninScreenButton: UIButton!
    
    var activeTextField : UITextField? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        statusOftheButton()
        mobileEmailTextField.borderStyle = .none
        passwordTextField.borderStyle = .none
        
        CongfigureTextFields()

        ConfigureTapGesture()

    }
    
    
    @IBAction func gotoHomeScreenWhenButtonTappedInSigninScreen(_ sender: UIButton) {
        
        
        objectOfSignInViewModel.requestApiForSignIn(mobile_email: mobileEmailTextField.text ?? "", password: passwordTextField.text ?? ""){ reposeIs in
            
            DispatchQueue.main.async {
                if reposeIs == true{
                    
                    let HomeVc = self.storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") as? TabBarViewController
                    
                    if let vc = HomeVc{
                        
                        self.navigationController?.pushViewController(vc, animated: true)
                    }
                    
                    
                    
                }else if reposeIs == false{
                    
                    self.alertMessage(message: "Invalid user name or password try again")
                    
                }else{
                    
                }
            }

        }
        
    }
    
    @IBAction func signUpButtonTappedInSignInScreen(_ sender: UIButton) {
        
 
        let signUpVc = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as? SignUpViewController
        
        if let vc = signUpVc{
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
       
        
    }
    
    @IBAction func mobile_EmailTextField(_ sender: Any) {
        
        statusOftheButton()
        
    }
    
    
    
    @IBAction func passwordField(_ sender: Any) {
        
        statusOftheButton()
    }
    
    

    
    
    
    @IBAction func forgotPasswordButtonTapped(_ sender: UIButton) {
        
        let forgotVc = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPasswordViewController") as? ForgotPasswordViewController
        
        if let vc = forgotVc{
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
        
        
    }
    
    
    
    func statusOftheButton() {
        
        if mobileEmailTextField.text != "" && passwordTextField.text != ""{
            
            gotoHomeScreenWhenButtonTappedInSigninScreenButton.isEnabled = true
            gotoHomeScreenWhenButtonTappedInSigninScreenButton.setImage(#imageLiteral(resourceName: "btn_signin-2"), for: .normal)
            
        }else{
            
            self.gotoHomeScreenWhenButtonTappedInSigninScreenButton.isEnabled = false
            self.gotoHomeScreenWhenButtonTappedInSigninScreenButton.setImage(#imageLiteral(resourceName: "btn_signin (1)"), for: .normal)
        }
        
    }
    
    
    func alertMessage(message: String){
        
            let alert = UIAlertController(title: "ALERT", message: message, preferredStyle: .alert)
        
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
            self.present(alert,animated: true, completion: nil)
        }

   
}



extension SignInViewController{
    
    @objc func keyboardWillShow(notification: NSNotification) {
            
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            
           return
            
        }
        
        var shouldMoveViewUp = false

          if let activeTextField = activeTextField {

            let bottomOfTextField = activeTextField.convert(activeTextField.bounds, to: self.view).maxY;
            
            let topOfKeyboard = self.view.frame.height - keyboardSize.height

            if bottomOfTextField > topOfKeyboard {
                
              shouldMoveViewUp = true
                
            }
            
          }

          if(shouldMoveViewUp) {
            
            self.view.frame.origin.y = 0 - keyboardSize.height
            
          }
        
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        
      self.view.frame.origin.y = 0
        
    }
    
    private func CongfigureTextFields(){

        mobileEmailTextField.delegate = self

        passwordTextField.delegate = self
        

    }

    private func ConfigureTapGesture(){
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SignInViewController.handleTap))

        view.addGestureRecognizer(tapGesture)

    }

    @objc func handleTap(){

        print("handle tap was called")

        view.endEditing(true)

    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if textField == mobileEmailTextField {
            
           textField.resignFirstResponder()
            
            passwordTextField.becomeFirstResponder()
            
        }
        
        else if textField == passwordTextField {
            
            textField.resignFirstResponder()
            
         }
        textField.resignFirstResponder()

        return true

    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        self.activeTextField = textField
        
      }
        
      func textFieldDidEndEditing(_ textField: UITextField) {
        
        self.activeTextField = nil
        
      }
    
    
    
}
