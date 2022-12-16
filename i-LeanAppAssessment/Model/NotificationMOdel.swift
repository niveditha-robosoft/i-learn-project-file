//
//  NotificationMOdel.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 16/12/22.
//

import Foundation


class NotificationModel {
    
    var notificationId: Int
    var title: String
    var message: String
    var localDateTime: String
    
    init(notificationId: Int,title: String,message: String,localDateTime: String) {
        self.notificationId = notificationId
        self.title = title
        self.message = message
        self.localDateTime = localDateTime
    }
}
