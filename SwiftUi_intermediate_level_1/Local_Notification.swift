//
//  Local_Notification.swift
//  SwiftUi_intermediate_level_1
//
//  Created by Apple1 on 03/12/2022.
//

import SwiftUI
import UserNotifications
class Notification{
    static let instance = Notification ()
    func requestAuthorization(){
        let option:UNAuthorizationOptions = [.alert,.sound,.badge]
        UNUserNotificationCenter.current().requestAuthorization(options: option){ (success,error) in
            if let error = error {
                print("Error is = \(error)")
            } else {
                print("Success")
            }
        }
    }
    func sheduleNotification(){
        let content = UNMutableNotificationContent()
        content.title = "hi i am Imranullah"
        content.subtitle = " I am software engineer"
        content.sound = .default
        content.badge = 1
//        **Time**
        let trigger =  UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)
        
//        **Calender**
//        var dateComponents=DateComponents()
//        dateComponents.hour = 16
//        dateComponents.minute = 15
//        dateComponents.weekday = 1
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        
//        Location
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        
        UNUserNotificationCenter.current().add(request)
    }
}

struct Local_Notification: View {
    var body: some View {
        VStack(spacing:20){
            Button("Request Permissiion"){
                Notification.instance.requestAuthorization()
            }
            Button("Shedule Notification"){
                Notification.instance.sheduleNotification()
            }
        }
    }
}

struct Local_Notification_Previews: PreviewProvider {
    static var previews: some View {
        Local_Notification()
    }
}
