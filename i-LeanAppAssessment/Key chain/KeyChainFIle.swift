//
//  KeyChainFIle.swift
//  i-LeanAppAssessment
//
//  Created by Shrushti Shetty on 22/12/22.
//

import Foundation
class KeyChain {

    

    func saveData(userId: String, data: Data)  {

        

        let query = [

            

            kSecClass as String: kSecClassGenericPassword,

            

            kSecAttrAccount as String: userId,

            

            kSecValueData as String: data ] as [String : Any]

   

        _ = SecItemAdd(query as CFDictionary, nil)

 

    }

 

    func loadData(userId: String) -> Data? {

        

        let query = [

            

            kSecClass as String: kSecClassGenericPassword,

            

            kSecAttrAccount as String: userId,

            

            kSecReturnData as String: kCFBooleanTrue!,

            

            kSecMatchLimit as String: kSecMatchLimitOne

            

        ] as [String: Any]

        

        

        

        var result: AnyObject? = nil

        

        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &result)

        

        if status == noErr {

            

            return result as! Data?

            

        } else {

            

            return nil

            

        }

        

    }

    

}
