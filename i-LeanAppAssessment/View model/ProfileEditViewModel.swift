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
    
    
    func profileEditApicall(imageFile: UIImage, nameText: String) {
        
        objectOfEditProfileModel.profileDataToUpdate(imageToUpdate: imageFile, nameToSend: nameText)
    }
}
