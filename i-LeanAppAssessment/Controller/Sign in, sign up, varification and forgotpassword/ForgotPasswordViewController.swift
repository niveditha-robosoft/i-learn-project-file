//
//  ViewController.swift
//  ForgotPassword
//
//  Created by Shrushti Shetty on 08/12/22.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var sendButton: UIButton!
    
    @IBOutlet weak var mobileNumberOrEmailField: CustomeTextField!
    
    
    var emailAndMobileData = ""
    
    var objectOfVarifyAccountViewModel = VarifyAccountViewModel.objectOfViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sendButton.layer.cornerRadius = 20

    }
    
    @IBAction func sendButtonTapped(_ sender: Any) {
        

        emailAndMobileData = mobileNumberOrEmailField.text ?? ""
        
        if mobileNumberOrEmailField.text != ""{

            if mobileNumberOrEmailField.text?.count == 10 && Int(mobileNumberOrEmailField.text ?? "") != nil {

                let loader =   self.loader()

                objectOfVarifyAccountViewModel.callApiForVarificationCode(dataTosend:"+91\(emailAndMobileData)"){ varifivationResponce in

                    DispatchQueue.main.async {
                        self.stopLoader(loader: loader)
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
                }
            }else{

                let loader =   self.loader()
                
                objectOfVarifyAccountViewModel.callApiForVarificationCode(dataTosend:emailAndMobileData.lowercased()){ varifivationResponce in

                    DispatchQueue.main.async() {
                        self.stopLoader(loader: loader)
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
                    }

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

}

