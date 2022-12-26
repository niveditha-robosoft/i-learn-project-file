//
//  QuestionListNetworkManager.swift
//  Questions List Display
//
//  Created by Shrushti Shetty on 10/12/22.
//

//import Foundation
//class TestNetworkManager{
//    func fetchList(at url: NSMutableURLRequest, completion: @escaping ([[String:Any]]?,Error?) -> Void) {
//        let task = URLSession.shared.dataTask(with: url as URLRequest) {
//            data, response, error in
//            if let apiData = data {
//                do {
//                   
//                    if let jsonData = try JSONSerialization.jsonObject(with: apiData, options: .mutableContainers)
//                        as? [[String:Any]]{
//                        print(jsonData)
//                        completion(jsonData,nil)
//                    }
//                    else{
//                        if let res = response as? HTTPURLResponse {
//                            print(res.statusCode, "statuscode")
//                            
//                            let body = String(data: data!, encoding: .nonLossyASCII)
//                            print("Response body: \(String(describing: body))")
//                        }
//                        print("fails")
//                    }
//                }
//                catch{
//                    print(error.localizedDescription, "this error")
//                }
//            } else {
//                print("no data")
//            }
//        }
//        task.resume()
//    }
//}
//
//extension Dictionary {
//    func percentEscaped() -> String {
//        return map { (key, value) in
//            let escapedKey = "\(key)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
//            let escapedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryValueAllowed) ?? ""
//            return escapedKey + "=" + escapedValue
//        }
//        .joined(separator: "&")
//    }
//}
//extension CharacterSet {
//    static let urlQueryValueAllowed: CharacterSet = {
//        let generalDelimitersToEncode = ":#[]@"
//        let subDelimitersToEncode = "!$&'()*+,;="
//        var allowed = CharacterSet.urlQueryAllowed
//        allowed.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
//        return allowed
//    }()
//    
//}
