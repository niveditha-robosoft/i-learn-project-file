//
//  EditProfileNetwork.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 15/12/22.
//

import Foundation
import UIKit

class EditProfileModel {
    
    func profileDataToUpdate(imageToUpdate: UIImage, nameToSend: String,token: String, completion: @escaping((Bool,Error?) -> ())) {
        
        guard let url = URL(string:"https://app-e-learning-221207163844.azurewebsites.net/user/profile") else{
            return
        }
        
        // Create a URLRequest with the given URL
            var request = URLRequest(url: url)

            // Set the HTTP method to PATCH
            request.httpMethod = "PATCH"

            // Set the content type to multipart/form-data
            let boundary = "Boundary-\(UUID().uuidString)"
            request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

            // Create a data object that will hold the body of the request
            let data = NSMutableData()

        let fieldName = "file"
            // Append the image to the body of the request
            if let imageData = imageToUpdate.jpegData(compressionQuality: 1) {
                data.append("--\(boundary)\r\n".data(using: .utf8)!)
                data.append("Content-Disposition: form-data; name=\"\(fieldName)\"; filename=\"image.jpg\"\r\n".data(using: .utf8)!)
                data.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
                data.append(imageData)
                data.append("\r\n".data(using: .utf8)!)
            }

        let name = "name"
            // Append the string to the body of the request
            data.append("--\(boundary)\r\n".data(using: .utf8)!)
            data.append("Content-Disposition: form-data; name=\"\(name)\"\r\n\r\n".data(using: .utf8)!)
            data.append(nameToSend.data(using: .utf8)!)
            data.append("\r\n".data(using: .utf8)!)

            // Add the closing boundary to the body of the request
            data.append("--\(boundary)--\r\n".data(using: .utf8)!)

            // Set the body of the request to the data object
            request.httpBody = data as Data

        let task = URLSession.shared.dataTask(with: request, completionHandler: { data, responce, error in
            
            guard let data = data, error == nil else{
                print("Profile Api Error is: \(error?.localizedDescription)")
                return
            }
          
            if let responsIs = responce as? HTTPURLResponse{

                print("Profile api responce",responsIs.statusCode)
                if (responsIs.statusCode == 200 || responsIs.statusCode == 201){

                    do{
                        let responsData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)

                        completion(true,nil)
                        
                    }
                }else if (responsIs.statusCode == 400) {
                    
                    completion(false,error)
                }

            }

        })
        
        task.resume()



    }

    
    
   
}

        
    

