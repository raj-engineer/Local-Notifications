//
//  ViewController.swift
//  Notifications
//
//  Created by Rajesh Sharma on 5/5/18.
//  Copyright © 2018 Rajesh Sharma. All rights reserved.
//

import UIKit
import UserNotifications

extension ViewController : UNUserNotificationCenterDelegate{
    // MARK: UNUserNotificationCenterDelegate
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        //Called when a notification is delivered to a foreground app.
        
        completionHandler([.alert,.sound ,.badge])
    }
}

class ViewController: UIViewController {

    // MARK: ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UNUserNotificationCenter.current().delegate = self
    }

    // MARK: IBAction
    @IBAction func notifyAction(_ sender: UIButton) {
        
        createNofication()
    }
    
    // MARK: Custom Action
    func createNofication(){
        
        let content  = UNMutableNotificationContent()
        content.title = "Title"
        content.subtitle = "SubTitle"
        content.body = "Body"
        content.sound = UNNotificationSound.default()
        
        let triger = UNTimeIntervalNotificationTrigger(timeInterval: 3.0, repeats: false)
        
        let request = UNNotificationRequest(identifier: "Identifier", content: content, trigger: triger)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            print(error as Any)
        }
        
        
    }
}

