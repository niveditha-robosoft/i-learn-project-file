//
//  ProfileEditViewModel.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 15/12/22.
//

import Foundation
import UIKit

class ProfileEditViewMOdel {
    
    static var objectOfViewModel = ProfileEditViewMOdel()
    
    var objectOfEditProfileModel = EditProfileModel()
    
    
    func profileEditApicall(imageFile: UIImage, nameText: String, tokenToSend: String, completion: @escaping((Bool) -> ())) {
        
        objectOfEditProfileModel.profileDataToUpdate(imageToUpdate: imageFile, nameToSend: nameText, token: tokenToSend){ responseData, responseError in
            
            DispatchQueue.main.async {
                
                if responseError == nil{
                    if responseData == true{
                        
                        completion(true)
                        
                    }else{
                       
                        completion(false)
                        
                    }
                    
                    
                }else{
                    
                    
                }
            }
  
        }
    }
}
