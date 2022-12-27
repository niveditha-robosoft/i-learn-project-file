//
//  NotificationViewModel.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 16/12/22.
//

import Foundation

class NotificationViewMOdel {
    
    var notificationDataToShow = [NotificationModel]()

    var objectOfNotificationNetwork = NotificationNetwork()
    
    static var objectOfViewModel = NotificationViewMOdel()
    
    func callApiFornotificationStatus(tokenToSend: String, completion: @ escaping((Bool) -> ())) {
        
        objectOfNotificationNetwork.notificationStatusApi(tokenToSend: tokenToSend){ completionData, completionError in
            
            DispatchQueue.main.async {
                if completionError == nil{
                    
                    if completionData == true{
                        
                        completion(true)
                    }else{
                        
                        completion(false)
                        
                    }
                    
                }else{
                    
                    
                }
            }
            
           
            
        }
        
    }
    
    
    func callApiForNotificationData(tokenToSend: String, completion: @escaping((Bool) -> ())) {
        
        objectOfNotificationNetwork.notificationDataApi(token: tokenToSend){ notificationData, completionCondition , notificationError in
            
            self.notificationDataToShow.removeAll()
            
            DispatchQueue.main.async {
        
                if notificationError == nil{
                    
                    if completionCondition == true{
                        
                        if let data0 = notificationData {
                            
                            for i in data0{
                                
                                guard let data1 = i["notificationId"] as? Int else{ completion(false)
                                    return}
                                guard let data2 = i["title"] as? String else{ completion(false)
                                    return}
                                guard let data3 = i["message"] as? String else{ completion(false)
                                    return}
                                guard let data4 = i["localDateTime"] as? String else{ completion(false)
                                    return}

                                let notification = NotificationModel(notificationId: data1, title: data2, message: data3, localDateTime: data4)
                                
                                self.notificationDataToShow.append(notification)
                                completion(true)
                            }
       
                        }
                        
                    }else{
                        
                        completion(false)
                        
                    }
                    
                    
                    
                    
                }else{
                    
                    completion(false)

                    
                }
            }
            
            
        }
    }
    
    
}
