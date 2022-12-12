//
//  ViewController.swift
//  ForgotPassword
//
//  Created by Shrushti Shetty on 08/12/22.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var sendButton: UIButton!
    
    @IBOutlet weak var mobileNumberOrEmailField: UITextField!
    
    
    var emailAndMobileData = ""
    
    var objectOfVarifyAccountViewModel = VarifyAccountViewModel.objectOfViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sendButton.layer.cornerRadius = 20
        mobileNumberOrEmailField.borderStyle = .none

    }
    
    @IBAction func sendButtonTapped(_ sender: Any) {
 
        emailAndMobileData = mobileNumberOrEmailField.text ?? ""
        
        print("emailAndMobileData :",emailAndMobileData)
        if mobileNumberOrEmailField.text != ""{

            if mobileNumberOrEmailField.text?.count == 10{

                objectOfVarifyAccountViewModel.callApiForVarificationCode(dataTosend:"+91\(emailAndMobileData)"){ varifivationResponce in

                    
                    if varifivationResponce == true {

                        let otpVc = self.storyboard?.instantiateViewController(withIdentifier: "VarifyAccountViewController") as? VarifyAccountViewController

                        if let vc = otpVc{

                            vc.x = 1
                            vc.signUpMobile_EmailIsIS = self.emailAndMobileData
                            self.navigationController?.pushViewController(vc, animated: true)

                        }

                    }else if varifivationResponce == false{

                        self.alertMessage(message: "Enter a valid Mabile Number or Email")

                    }
                    else{
                        
                        
                    }

                }
            }else{


                objectOfVarifyAccountViewModel.callApiForVarificationCode(dataTosend:emailAndMobileData){ varifivationResponce in


                    if varifivationResponce == true{

                        let otpVc = self.storyboard?.instantiateViewController(withIdentifier: "VarifyAccountViewController") as? VarifyAccountViewController

                        if let vc = otpVc{

                            vc.x = 1
                            vc.signUpMobile_EmailIsIS = self.emailAndMobileData
                            self.navigationController?.pushViewController(vc, animated: true)

                        }

                    }else{

                        self.alertMessage(message: "Enter a valid Mabile Number or Email")

                    }

                    print("9876545678765r56787trdfyuytfcuiasghcvh8usdvgh",varifivationResponce)
                }


            }

        }
        else{

            alertMessage(message: "Mobile number or Email field should not be empty")

        }
        
        
   
    }
    
    @IBAction func backbuttonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func alertMessage(message: String){
        
            let alert = UIAlertController(title: "ALERT", message: message, preferredStyle: .alert)
        
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
            self.present(alert,animated: true, completion: nil)
        }
    


}

