//
//  EditProfileNetwork.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 15/12/22.
//

import Foundation
import UIKit

class EditProfileModel {
    
    func profileDataToUpdate(imageToUpdate: UIImage, nameToSend: String) {
        
        
        let imageData = imageToUpdate.jpegData(compressionQuality: 0.9)

        let boundary = "Boundary-\(UUID().uuidString)"
        
        guard let url = URL(string:"https://app-e-learning-221207163844.azurewebsites.net/user/profile") else{return}

        var request = URLRequest(url: url)

        request.httpMethod = "PATCH"


        let httpBody = NSMutableData()


            httpBody.appendString(convertFormField(named: "name", value: nameToSend, using: boundary))


        if let image = imageData {

            httpBody.append(convertFileData(fieldName: "file",fileName: "profile.jpeg",mimeType: "img/png",fileData: image,using: boundary))
            }

        httpBody.appendString("--\(boundary)--")

        request.httpBody = httpBody as Data

        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")


        URLSession.shared.dataTask(with: request) { data, response, error in

            guard let data = data, error == nil else{
                                print("Error is: \(error?.localizedDescription)")
                                return
                            }
            
            
                            if let responsIs = response as? HTTPURLResponse{
            
                                print("Edit responce : ",responsIs.statusCode)
                                if (responsIs.statusCode == 200 || responsIs.statusCode == 201){
            
                                    do{
                                        let responsData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
            
                                        if let data1 = responsData as? [String: Any]{
            
                                            print("create password data : ",data1)
            
                                        }
            
                                    }
                                }else if responsIs.statusCode == 400{
            
            
                                }else{
                                    print("Create pass word Responce Error is: ", error?.localizedDescription)
                                }
            
                            }


        }.resume()

//        let imageData = imageToUpdate.jpegData(compressionQuality: 0.9)
//
//        let httpBody = NSMutableData()
//
//        let boundary = "Boundary-\(UUID().uuidString)"
//
//        if let image = imageData {
//
//            httpBody.append(convertFileData(fieldName: "file",fileName: "profile.jpeg",mimeType: "img/png",fileData: image,using: boundary))
//
//        }
//
//        print("image is is : ",httpBody)
//
//
//
//        let nameText =  httpBody.appendString(convertFormField(named: "name", value: nameToSend, using: boundary))
//
//        print("text is is : ", httpBody)
//
//        guard let url = URL(string:"https://app-e-learning-221207163844.azurewebsites.net/user/profile") else{
//            return
//        }
//
//        var request = URLRequest(url: url)
//
//        request.httpMethod = "PATCH"
//
//        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
//
//        httpBody.appendString("--\(boundary)--")
//
//        request.httpBody = httpBody as Data
//
//            let task = URLSession.shared.dataTask(with: request, completionHandler: { data, responce, error in
//
//                guard let data = data, error == nil else{
//                    print("Error is: \(error?.localizedDescription)")
//                    return
//                }
//
//
//                if let responsIs = responce as? HTTPURLResponse{
//
//                    print("Edit responce : ",responsIs.statusCode)
//                    if (responsIs.statusCode == 200 || responsIs.statusCode == 201){
//
//                        do{
//                            let responsData = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
//
//                            if let data1 = responsData as? [String: Any]{
//
//                                print("create password data : ",data1)
//
//                            }
//
//                        }
//                    }else if responsIs.statusCode == 400{
//
//
//                    }else{
//                        print("Create pass word Responce Error is: ", error?.localizedDescription)
//                    }
//
//                }
//
//            })
//
//            task.resume()


    }


    func convertFileData(fieldName: String, fileName: String, mimeType: String, fileData: Data, using boundary: String) -> Data {

        let data = NSMutableData()

        data.appendString("--\(boundary)\r\n")

        data.appendString("Content-Disposition: form-data; name=\"\(fieldName)\"; filename=\"\(fileName)\"\r\n")

        data.appendString("Content-Type: \(mimeType)\r\n\r\n")

        data.append(fileData)

        data.appendString("\r\n")

        return data as Data

    }



    func convertFormField(named name: String, value: Any, using boundary: String) -> String {

        var fieldString = "--\(boundary)\r\n"

        fieldString += "Content-Disposition: form-data; name=\"\(name)\"\r\n"

        fieldString += "\r\n"

        fieldString += "\(value)\r\n"

        return fieldString

    }

         
//
//    func postData(url: String, parameters: [String: Any], headers: [String: String]?, image: UIImage?, completion: @escaping(Int? , Error?) -> Void) {
//
//        let imageData = image?.jpegData(compressionQuality: 0.9)
//
//        let boundary = "Boundary-\(UUID().uuidString)"
//
//        var request = URLRequest(url: URL(string: url)!)
//
//        request.httpMethod = "POST"
//
//        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
//
//        let httpBody = NSMutableData()
//
//        for (key, value) in parameters {
//
//            httpBody.appendString(convertFormField(named: key, value: value, using: boundary))
//
//        }
//
//        if let image = imageData {
//
//            httpBody.append(convertFileData(fieldName: "profilePhoto",fileName: "profile.jpeg",mimeType: "img/png",fileData: image,using: boundary))
//            }
//
//        httpBody.appendString("--\(boundary)--")
//
//        request.httpBody = httpBody as Data
//
//        request.allHTTPHeaderFields = headers
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//
//            if let response = response as? HTTPURLResponse {
//
//                print("Response", response.statusCode)
//
//                print(response.description)
//
//                completion(response.statusCode,nil)
//
//            }
//
//            if error != nil {
//
//                print(error?.localizedDescription as Any)
//
//                completion(nil,error)
//
//            }
//
//        }.resume()
//
//    }
 
    
    
    
//    func uploadImage(paramName: String, fileName: String, image: UIImage) {
//        let url = URL(string: "http://api-host-name/v1/api/uploadfile/single")
//
//        // generate boundary string using a unique per-app string
//        let boundary = UUID().uuidString
//
//        let session = URLSession.shared
//
//        // Set the URLRequest to POST and to the specified URL
//        var urlRequest = URLRequest(url: url!)
//        urlRequest.httpMethod = "PATCH"
//
//        // Set Content-Type Header to multipart/form-data, this is equivalent to submitting form data with file upload in a web browser
//        // And the boundary is also set here
//        urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
//
//        var data = Data()
//
//        // Add the image data to the raw http request data
//        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
//        data.append("Content-Disposition: form-data; name=\"\(paramName)\"; filename=\"\(fileName)\"\r\n".data(using: .utf8)!)
//        data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
//        data.append(image.pngData()!)
//
//        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
//
//        // Send a POST request to the URL, with the data we created earlier
//        session.uploadTask(with: urlRequest, from: data, completionHandler: { responseData, response, error in
//            if error == nil {
//                let jsonData = try? JSONSerialization.jsonObject(with: responseData!, options: .allowFragments)
//                if let json = jsonData as? [String: Any] {
//                    print(json)
//                }
//            }
//        }).resume()
//    }

    

    
}


extension NSMutableData {

    func appendString(_ string: String) {

        if let data = string.data(using: .utf8) {

            self.append(data)

        }

    }

}
