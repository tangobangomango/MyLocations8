//
//  SceneDelegate.swift
//  MyLocations8
//
//  Created by Ed Katzman on 3/26/20.
//  Copyright © 2020 TDG. All rights reserved.
//

import UIKit
import CoreData

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores {
            (storeDescription, error)  in
            if let error = error {
                fatalError("Could not load data store: \(error)")
            }
        }
        return container
    }()
    
    lazy var managedObjectContext: NSManagedObjectContext = persistentContainer.viewContext



    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
        
        let tabController = window!.rootViewController as! UITabBarController
        
        if let tabViewControllers = tabController.viewControllers {
            var navigationController = tabViewControllers[0] as! UINavigationController
            let controller1 = navigationController.viewControllers.first as! CurrentLocationViewController
            controller1.managedObjectContext = managedObjectContext
            
            navigationController = tabViewControllers[1] as! UINavigationController
            let controller2 = navigationController.viewControllers.first as! LocationsViewController
            controller2.managedObjectContext = managedObjectContext
            let _ = controller2.view
            
            navigationController = tabViewControllers[2] as! UINavigationController
            let controller3 = navigationController.viewControllers.first as! MapViewController
            controller3.managedObjectContext = managedObjectContext
            
            
        }
    }
    
    // MARK: - Helper methods
        
        func listenForFatalCoreDataNotifications() {
            NotificationCenter.default.addObserver(forName: CoreDataSaveFailedNotification, object: nil, queue: OperationQueue.main, using: { notification in
                let message = """
    There was an error in the app and it cannot continue.

    Press OK to terminate.
    """
                let alert = UIAlertController(title: "Internal Error", message: message, preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default,  handler: {_ in
                    let exception = NSException(name: NSExceptionName.internalInconsistencyException, reason: "Fatal core data error", userInfo: nil)
                    exception.raise()
                    
                })
                    alert.addAction(action)
                
                let tabController = self.window!.rootViewController!
                tabController.present(alert, animated: true, completion: nil)
                
            })
        }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

