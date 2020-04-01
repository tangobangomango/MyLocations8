//
//  Functions.swift
//  MyLocations8
//
//  Created by Ed Katzman on 3/28/20.
//  Copyright © 2020 TDG. All rights reserved.
//

import Foundation

func afterDelay(_ seconds: Double, run: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: run)
}

let applicationDocumentsDirectory: URL = {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}()

let CoreDataSaveFailedNotification = Notification.Name("CoreDataSaveFailedNotifcation")

func fatalCoreDataError(_ error: Error) {
    NotificationCenter.default.post(name: CoreDataSaveFailedNotification, object: nil)
}
