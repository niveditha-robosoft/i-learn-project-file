//
//  varifyCodeViewController.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 06/12/22.
//

import UIKit

class VarifyAccountViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var resendButton: UIButton!
    @IBOutlet weak var invalidPinView: UIView!
    @IBOutlet weak var firstFieldText: UITextField!
    @IBOutlet weak var secondFieldText: UITextField!
    @IBOutlet weak var thirdFieldText: UITextField!
    @IBOutlet weak var fourthFieldText: UITextField!
    @IBOutlet weak var goToHomeScreenButton: UIButton!
    
    
    
    var activeTextField : UITextField? = nil
    
    
    var x = 0
        
        
    var otp = 0
    var otpString = ""
    var signUpMobile_EmailIsIS = ""
    
    var objectOfVarifyAccountViewModel = VarifyAccountViewModel.objectOfViewModel
    
    let yourAttributes: [NSAttributedString.Key: Any] = [
          .font: UIFont.systemFont(ofSize: 16),
          .underlineStyle: NSUnderlineStyle.single.rawValue
      ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        invalidPinView.isHidden = true
        objectOfVarifyAccountViewModel.callApiForVarificationCode(dataTosend: signUpMobile_EmailIsIS){ varifivationResponce in
            
            print(varifivationResponce)
            
            print(")))))))))))))))",self.signUpMobile_EmailIsIS)
        }
        
        self.goToHomeScreenButton.isEnabled = false
        self.goToHomeScreenButton.setImage(#imageLiteral(resourceName: "btn_signin (1)"), for: .normal)
        
        let attributeString = NSMutableAttributedString(
                string: "Resend",
                attributes: yourAttributes
             )

        resendButton.setAttributedTitle(attributeString, for: .normal)

        // Do any additional setup after loading the view.
        roundLabel.layer.masksToBounds = true
        roundLabel.layer.cornerRadius = 8.0
        
        firstFieldText.delegate = self

        secondFieldText.delegate = self
        
        thirdFieldText.delegate = self

        fourthFieldText.delegate = self
        
        CongfigureTextFields()

        ConfigureTapGesture()
        
        print("x =",x)
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 1
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)

        return newString.count <= maxLength
    }
    
    func enableTheButtonToMoveToHomeScreen() {
        
        hideError()
        goToHomeScreenButton.isEnabled = true
        goToHomeScreenButton.setImage(#imageLiteral(resourceName: "btn_signin-3"), for: .normal)
        
        
    }
    
    func hideError() {
        
        firstFieldText.layer.borderWidth = 2.0
        firstFieldText.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        secondFieldText.layer.borderWidth = 2.0
        secondFieldText.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        thirdFieldText.layer.borderWidth = 2.0
        thirdFieldText.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        fourthFieldText.layer.borderWidth = 2.0
        fourthFieldText.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        invalidPinView.isHidden = true
    }
    
    
    
    func varifivationFailedShowError() {
        
        goToHomeScreenButton.isEnabled = false
        goToHomeScreenButton.setImage(#imageLiteral(resourceName: "btn_signin (1)"), for: .normal)
        
        firstFieldText.layer.borderWidth = 2.0
        firstFieldText.layer.borderColor = #colorLiteral(red: 0.9725490196, green: 0.568627451, blue: 0.568627451, alpha: 1)
        secondFieldText.layer.borderWidth = 2.0
        secondFieldText.layer.borderColor = #colorLiteral(red: 0.9725490196, green: 0.568627451, blue: 0.568627451, alpha: 1)
        thirdFieldText.layer.borderWidth = 2.0
        thirdFieldText.layer.borderColor = #colorLiteral(red: 0.9725490196, green: 0.568627451, blue: 0.568627451, alpha: 1)
        fourthFieldText.layer.borderWidth = 2.0
        fourthFieldText.layer.borderColor = #colorLiteral(red: 0.9725490196, green: 0.568627451, blue: 0.568627451, alpha: 1)
        invalidPinView.isHidden = false
        
    }
    
    
    
    
    
    @IBAction func goToHomeScreenWhenTapped(_ sender: UIButton) {

        
        callTheApi()
 
    }
    
    @IBAction func goBackToSignUpScreen(_ sender: UIScreen) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func resendOtp(_ sender: UIButton) {
        
       
        
        objectOfVarifyAccountViewModel.callApiForVarificationCode(dataTosend: signUpMobile_EmailIsIS){ varifivationResponce in
            
            print(varifivationResponce)
        }
        
    }
    
    @IBAction func firstField(_ sender: Any) {
        
        if firstFieldText.text != "" && secondFieldText.text != "" && thirdFieldText.text != "" && fourthFieldText.text != ""{
            
            goToHomeScreenButton.isEnabled = true
            goToHomeScreenButton.setImage(#imageLiteral(resourceName: "btn_signin-1"), for: .normal)
            
   
        }else{
            
            goToHomeScreenButton.isEnabled = false
            goToHomeScreenButton.setImage(#imageLiteral(resourceName: "btn_signin (1)"), for: .normal)
            
        }
    }
    
    @IBAction func secondField(_ sender: Any) {
        if firstFieldText.text != "" && secondFieldText.text != "" && thirdFieldText.text != "" && fourthFieldText.text != ""{
            
            goToHomeScreenButton.isEnabled = true
            goToHomeScreenButton.setImage(#imageLiteral(resourceName: "btn_signin-1"), for: .normal)
            
   
        }else{
            
            goToHomeScreenButton.isEnabled = false
            goToHomeScreenButton.setImage(#imageLiteral(resourceName: "btn_signin (1)"), for: .normal)
            
        }
    }
    
    @IBAction func thirdField(_ sender: Any) {
        if firstFieldText.text != "" && secondFieldText.text != "" && thirdFieldText.text != "" && fourthFieldText.text != ""{
            
            goToHomeScreenButton.isEnabled = true
            goToHomeScreenButton.setImage(#imageLiteral(resourceName: "btn_signin-1"), for: .normal)
            
   
        }else{
            
            goToHomeScreenButton.isEnabled = false
            goToHomeScreenButton.setImage(#imageLiteral(resourceName: "btn_signin (1)"), for: .normal)
            
        }
    }
    
    
    func callTheApi() {
        
        
        
        var data11 = "", data22 = "" , data33 = "" , data44 = ""
        if let data1 = firstFieldText.text{
            data11 = data1
        }
        
        if let data2 = secondFieldText.text{
            data22 = data2
        }
        
        if let data3 = thirdFieldText.text{
            data33 = data3
        }
        
        if let data4 = fourthFieldText.text{
            data44 = data4
        }
        
        
        otp = Int("\(data11)\(data22)\(data33)\(data44)") ?? 0
        
        print("\(signUpMobile_EmailIsIS)\(otp)")
                    
        objectOfVarifyAccountViewModel.varifyTheSentOtpwithApi(mobile_Emailis: signUpMobile_EmailIsIS, otpIs: otp){ varifyResponce in


            DispatchQueue.main.async {

                print("09876543234567890-9876543",varifyResponce)

                if varifyResponce == true{

                    self.hideError()

                    print("done")

                    if self.x == 0{

                        print("00000",self.x)

                        let homeVc = self.storyboard?.instantiateViewController(identifier: "SignInViewController") as? SignInViewController

                        if let vc = homeVc{

                            self.navigationController?.pushViewController(vc, animated: true)

                        }

                    }else{

                        print("1111",self.x)

                        let homeVc = self.storyboard?.instantiateViewController(identifier: "CreatePasswordViewController") as? CreatePasswordViewController

                        if let vc = homeVc{
                            
                            print("0000000987656789876567898\(self.signUpMobile_EmailIsIS)\(self.otp)")

                            vc.mobile_EmailToSend = self.signUpMobile_EmailIsIS

                            self.navigationController?.pushViewController(vc, animated: true)



                    }
                    }




            }else if varifyResponce == false{

                self.varifivationFailedShowError()

            }else{

            }

        }


    }
    }

    
    
    
    @IBAction func lastFieldvarification(_ sender: Any) {
        
        
        if firstFieldText.text != "" && secondFieldText.text != "" && thirdFieldText.text != "" && fourthFieldText.text != ""{
            
            goToHomeScreenButton.isEnabled = true
            goToHomeScreenButton.setImage(#imageLiteral(resourceName: "btn_signin-1"), for: .normal)
            
   
        }else{
            
            goToHomeScreenButton.isEnabled = false
            goToHomeScreenButton.setImage(#imageLiteral(resourceName: "btn_signin (1)"), for: .normal)
            
        }
 
    }
    
    func alertMessage(message: String){
        
            let alert = UIAlertController(title: "ALERT", message: message, preferredStyle: .alert)
        
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
            self.present(alert,animated: true, completion: nil)
        }

}


extension VarifyAccountViewController{
    
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

        firstFieldText.delegate = self

        secondFieldText.delegate = self
        
        thirdFieldText.delegate = self

        fourthFieldText.delegate = self

    }

    private func ConfigureTapGesture(){
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(VarifyAccountViewController.handleTap))

        view.addGestureRecognizer(tapGesture)

    }

    @objc func handleTap(){

        print("handle tap was called")

        view.endEditing(true)

    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if textField == firstFieldText {
            
           textField.resignFirstResponder()
            
           secondFieldText.becomeFirstResponder()
            
        }
        else if textField == secondFieldText {
            
           textField.resignFirstResponder()
            
           thirdFieldText.becomeFirstResponder()
            
        }
        else if textField == thirdFieldText {
            
           textField.resignFirstResponder()
            
            fourthFieldText.becomeFirstResponder()
            
        }
        
        else if textField == fourthFieldText {
            
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
