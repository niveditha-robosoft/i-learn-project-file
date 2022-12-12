//
//  varifyAccountViewModel.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 08/12/22.
//

import Foundation

class VarifyAccountViewModel {
    
    static var objectOfViewModel = VarifyAccountViewModel()
    var objectOfVarificationNetwork = VarificationNetwork()
    
    func callApiForVarificationCode(dataTosend: String,completion: @escaping((Bool) -> () )) {
        
        objectOfVarificationNetwork.apiCallForVarificationCode(sendDataToApi: dataTosend){ varificationData, varificationError in
            
            if varificationError == nil{
                
                DispatchQueue.main.async {
                    
                    
                    if varificationData == true{
                        completion(true)
                    }else{
                        completion(false)
                    }
                    
                    
                    
                    
                    
                }
                
                
                
            }
            
        }
        
    }
    
    
    
    func varifyTheSentOtpwithApi(mobile_Emailis: String, otpIs: Int, completion: @escaping((Bool) -> ())) {
        
        
        objectOfVarificationNetwork.varifyTheOtp(sendmobile_email: mobile_Emailis, sendOtp: otpIs){ varificationData, varificationError in
            
            if varificationError == nil{
                
                if varificationData == true{
                    
                    completion(true)
                }else{
                    
                    completion(false)
                }
                
            }
        }
        
        
    }
    
    
    
    
    
    
}
