//
//  ViewController.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 06/12/22.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    var objectOfSignUpViewModel = SignUpViewModel.objectOfViewModel
    
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var mobile_EmailText: UITextField!
    @IBOutlet weak var createPasswordText: UITextField!
    @IBOutlet weak var confirmPasswordText: UITextField!
    @IBOutlet weak var signUpDoneAndGoToVarificationScreenButton: UIButton!
    
    
    var activeTextField : UITextField? = nil
    
    var nameToSend = ""
    var mobile_EmailToSend = ""
    var enteredCreatePassword = ""
    
    
    let yourAttributes: [NSAttributedString.Key: Any] = [
          .font: UIFont.systemFont(ofSize: 16),
          .underlineStyle: NSUnderlineStyle.single.rawValue
      ]

    override func viewDidLoad() {
        super.viewDidLoad()
   
        
        let attributeString = NSMutableAttributedString(
                string: "Sign in",
                attributes: yourAttributes
             )
        
        signInButton.tintColor = #colorLiteral(red: 0.2980392157, green: 0.5764705882, blue: 1, alpha: 1)
        nameText.borderStyle = .none
        mobile_EmailText.borderStyle = .none
        createPasswordText.borderStyle = .none
        confirmPasswordText.borderStyle = .none
        signInButton.setAttributedTitle(attributeString, for: .normal)
        signInButton.titleLabel?.font = UIFont(name: "Rubik-Medium", size: 16)

        CongfigureTextFields()

        ConfigureTapGesture()
    
    }
    
    
    func allowAccessToMoveToVarificationScreen(){
        
        if  nameText.text != "" && mobile_EmailText.text != "" && confirmPasswordText.text != "" && createPasswordText.text != ""  {
            
//            self.passwordToSend = confirmPasswordText.text ?? ""
            signUpDoneAndGoToVarificationScreenButton.isEnabled = true
            signUpDoneAndGoToVarificationScreenButton.setImage(#imageLiteral(resourceName: "btn_signin-2"), for: .normal)

        }else{
            
            signUpDoneAndGoToVarificationScreenButton.isEnabled = false
            signUpDoneAndGoToVarificationScreenButton.setImage(#imageLiteral(resourceName: "btn_signin (1)"), for: .normal)
            
        }
        
        
    }
    
    @IBAction func namteTextfield(_ sender: Any) {
        
        allowAccessToMoveToVarificationScreen()

    }
    
    @IBAction func mobile_EmailTextField(_ sender: Any) {
        allowAccessToMoveToVarificationScreen()

    }

    @IBAction func createPasswordTextField(_ sender: Any) {
        
        allowAccessToMoveToVarificationScreen()
    }
    
    @IBAction func confirmTextField(_ sender: Any) {
        
        allowAccessToMoveToVarificationScreen()
        
    }
    
    
    
    @IBAction func goToSignInScreen(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
  
    
    
    @IBAction func signUpDoneAndGoToVarificationScreen(_ sender: UIButton) {
   
        nameToSend = nameText.text ?? ""
        
        var condition = isValidPassword(pass1: createPasswordText.text ?? "")
        
        if condition == true{
            
            enteredCreatePassword = createPasswordText.text ?? ""
//                print("Strong password is been created")
        }else{
            enteredCreatePassword = ""
            
            self.alertMessage(message: "Create a strong password")
            
        }
        
        
        var emailCondition = isValidEmail(email: mobile_EmailText.text ?? "")
        
        if emailCondition == true{
            
            mobile_EmailToSend = mobile_EmailText.text ?? ""
            
        }else{
            
            if mobile_EmailText.text?.count == 10 && mobile_EmailText.text != "" {
                
                if let number = mobile_EmailText.text{
                    
                    mobile_EmailToSend = "+91\(number)"
                }
               
                }
            else{
                
            }


            }
        
        
        
        if confirmPasswordText.text == enteredCreatePassword {
            

            
            objectOfSignUpViewModel.ViewModelPostTheDataToApi(name: nameToSend.lowercased(), mobilenumber_Email: mobile_EmailToSend, password: enteredCreatePassword){ responsIs in

                        if responsIs == true{


                            let varifyVc = self.storyboard?.instantiateViewController(withIdentifier: "VarifyAccountViewController") as? VarifyAccountViewController

                            if let vc = varifyVc {

                                vc.signUpMobile_EmailIsIS = self.mobile_EmailToSend
                                self.navigationController?.pushViewController(vc, animated: true)

                            }


                        }else if responsIs == false{

                            self.alertMessage(message: "Already you have an account pleace try to Sign In")


                        } else{

                        }

                    }
            
            
        }else{
            
            self.alertMessage(message: "Create password and confirm passwod asre not matching try again")
            
        }
        
        
        
        
        
//
        
    }
    

}


extension SignUpViewController{
    
    public func isValidPassword(pass1: String) -> Bool {

            let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@#$%^&+=])[A-Za-z\\d$@$!%*?&#]{8,50}"

            return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: pass1)

        }
    
    public func isValidEmail(email: String) -> Bool {

            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

            let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)

            return emailPred.evaluate(with: email)

        }
    
    func alertMessage(message: String){
        
            let alert = UIAlertController(title: "ALERT", message: message, preferredStyle: .alert)
        
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
            self.present(alert,animated: true, completion: nil)
        }
    
    
    
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

        nameText.delegate = self

        mobile_EmailText.delegate = self
        
        createPasswordText.delegate = self

        confirmPasswordText.delegate = self

    }

    private func ConfigureTapGesture(){
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(SignUpViewController.handleTap))

        view.addGestureRecognizer(tapGesture)

    }

    @objc func handleTap(){

        print("handle tap was called")

        view.endEditing(true)

    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if textField == nameText {
            
           textField.resignFirstResponder()
            
           mobile_EmailText.becomeFirstResponder()
            
        }
        else if textField == mobile_EmailText {
            
           textField.resignFirstResponder()
            
           createPasswordText.becomeFirstResponder()
            
        }
        else if textField == createPasswordText {
            
           textField.resignFirstResponder()
            
            confirmPasswordText.becomeFirstResponder()
            
        }
        
        else if textField == confirmPasswordText {
            
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
