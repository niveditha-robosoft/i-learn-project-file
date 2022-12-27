//
//  SignInViewController.swift
//  i-LeanAppAssessment
//
//  Created by Shrushti Shetty on 06/12/22.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate{
    
    var userDefault = UserDefaults()

    
    var objectOfSignInViewModel = SignInViewModel.objectOfViewModel
    
    @IBOutlet weak var mobileEmailTextField: CustomeTextField!
    
    @IBOutlet weak var passwordTextField: CustomeTextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var signInSkipButton: UIButton!
    
    @IBOutlet weak var gotoHomeScreenWhenButtonTappedInSigninScreenButton: UIButton!
    
    var activeTextField : UITextField? = nil


    let yourAttributes: [NSAttributedString.Key: Any] = [
          .font: UIFont.systemFont(ofSize: 16),
          .underlineStyle: NSUnderlineStyle.single.rawValue
      ]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let attributeString = NSMutableAttributedString(
                string: "Skip",
                attributes: yourAttributes
             )
        
        
        signInSkipButton.setAttributedTitle(attributeString, for: .normal)
        signInSkipButton.titleLabel?.font = UIFont(name: "Rubik-Medium", size: 16)
        
        statusOftheButton()

        CongfigureTextFields()

        ConfigureTapGesture()
        
        if navigationController?.responds(to: #selector(getter: UINavigationController.interactivePopGestureRecognizer)) ?? false {
            navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        }

    }
    
    
    
    @IBAction func gotoHomeScreenWhenButtonTappedInSigninScreen(_ sender: UIButton) {
        
        callApi()
    
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
    
    @IBAction func signInSkipButtonTapped(_ sender: UIButton) {
        
        print("sign in skip tapped 1")
        let HomeVc = self.storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") as? TabBarViewController
        
        if let vc = HomeVc {
            print("sign in skip tapped 2")

            userDefault.setValue(3, forKeyPath: "Status")

            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    
    
    func callApi() {
        
        let loader =   self.loader()
        
        objectOfSignInViewModel.requestApiForSignIn(mobile_email: mobileEmailTextField.text ?? "", password: passwordTextField.text ?? ""){ reposeIs, responceCondition in
            
            DispatchQueue.main.async() {
                self.stopLoader(loader: loader)
                if reposeIs == true && responceCondition == 0{
                    
                    let HomeVc = self.storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") as?
                    TabBarViewController

                    if let vc = HomeVc{

                        self.navigationController?.pushViewController(vc, animated: true)
                    }


                }else if reposeIs == false && responceCondition == 0{
                    DispatchQueue.main.async {
                        self.alertMessage(message: "Invalid User Name or Password Try Again or Try to Sign Up")
                    }
                    
                    
                    
                }else{
                    DispatchQueue.main.async {
                        self.alertMessage(message: "Try to Sign Up")
                    }
                }
            }

        }
        
        
        
    }
    
    
    
    func statusOftheButton() {
        
        if mobileEmailTextField.text != "" && passwordTextField.text != ""{
            
            gotoHomeScreenWhenButtonTappedInSigninScreenButton.isEnabled = true
            gotoHomeScreenWhenButtonTappedInSigninScreenButton.setImage(#imageLiteral(resourceName: "Screenshot 2022-12-25 at 11.53.37 AM"), for: .normal)
            
        }else{
            
            self.gotoHomeScreenWhenButtonTappedInSigninScreenButton.isEnabled = false
            self.gotoHomeScreenWhenButtonTappedInSigninScreenButton.setImage(#imageLiteral(resourceName: "Screenshot 2022-12-25 at 11.52.06 AM"), for: .normal)
        }
        
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
