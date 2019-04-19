//
//  AppDelegate.swift
//  Brdge
//
//  Created by Andre Campbell on 3/21/19.
//  Copyright © 2019 awBell. All rights reserved.
//

import UIKit
import MediaPlayer

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let gsController = GlobalStateController()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let tabBarController = window?.rootViewController as! BaseTabBarController
        
        for vc in tabBarController.viewControllers! {
            if (vc is HomeViewController) {
                let vc1 = vc as! HomeViewController
                vc1.gsController = gsController
                
            }
            else  if (vc is NowPlayingViewController) {
                let vc1 = vc as! NowPlayingViewController
                vc1.gsController = gsController
                
            }
            else if (vc is SettingsViewController) {
                let vc1 = vc as! SettingsViewController
                vc1.gsController = gsController
                
            }
            else {
                print(vc)
            }
        }
        Thread.sleep(forTimeInterval: 1.5) // NEVER DO THIS, BUT FUCK IT!
        return true
            
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}

