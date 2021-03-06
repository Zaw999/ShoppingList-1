//
//  AppDelegate.swift
//  ShoppingList
//
//  Created by Mac on 2017/09/09.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit

extension UserDefaults {
    func set(_ color: UIColor, forKey key: String) {
        set(NSKeyedArchiver.archivedData(withRootObject: color), forKey: key)
    }
    func color(forKey key: String) -> UIColor? {
        guard let data = data(forKey: key) else { return nil }
        return NSKeyedUnarchiver.unarchiveObject(with: data) as? UIColor
    }
}

extension Array {
    mutating func remove(indices: IndexSet) {
        self = self.enumerated().filter { !indices.contains($0.offset) }.map { $0.element }
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let tabBarController:UITabBarController = self.window?.rootViewController as! UITabBarController
        SLShoppingListData.sharedInstance.tabBarController = tabBarController
        
        let defaultColor = UIColor(red: 219.0/255.0, green: 10.0/255.0, blue: 91.0/255.0, alpha: 1.0)
        UserDefaults.standard.set(defaultColor, forKey: "globalColor")
        
        let color = UserDefaults.standard.color(forKey: "globalColor")!
        UINavigationBar.appearance().tintColor = color
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: color]
        UITextView.appearance().tintColor = color
        UITabBar.appearance().tintColor = color
        self.window?.tintColor = color
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

