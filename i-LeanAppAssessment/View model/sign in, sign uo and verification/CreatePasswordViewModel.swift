//
//  CreatePasswordViewModel.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 10/12/22.
//

import Foundation


class CreatePasswordViewModel {
    
    static var objrctOfViewModel = CreatePasswordViewModel()
    var objectOfVarificationNetwork = VarificationNetwork()
    
    func sendResetPasswordDataToApi(mobile_EmaildataToSend: String, newPasswordToSend: String, completion: @escaping((Bool) -> ())) {
        
        objectOfVarificationNetwork.createNewPassword(sendmobile_email: mobile_EmaildataToSend, newPasswordToApi: newPasswordToSend){ datais, errorIs in
            
            DispatchQueue.main.async {
                if errorIs == nil{
                    
                    
                    if datais == true{
                        completion(true)
                        
                    }else{
                        completion(false)
                    }
                    
                    
                    
                }
            }
            
            
        }
    }
}
