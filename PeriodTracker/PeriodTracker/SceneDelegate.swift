//
//  SceneDelegate.swift
//  PeriodTracker
//
//  Created by Paola Castro on 3/16/20.
//  Copyright © 2020 Paola Castro. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let winScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: winScene)
        rootViewController()
    }
    
    func rootViewController() {
        window?.rootViewController = mainNavigation()
        window?.makeKeyAndVisible()
    }
    
    func mainNavigation() -> UITabBarController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
             
        
        let calendarViewController = storyboard.instantiateViewController(withIdentifier: K.calendarVC)
        let navController = UINavigationController(rootViewController: calendarViewController)
        navController.tabBarItem = UITabBarItem(title: K.Copy.navCalendar, image: UIImage(systemName: "calendar"), tag: 1)

        let LogViewController = storyboard.instantiateViewController(withIdentifier: K.logVC)
        let logNavVC = UINavigationController(rootViewController: LogViewController)
        logNavVC.tabBarItem = UITabBarItem(title: K.Copy.navLog, image: UIImage(systemName:
        "pencil.and.ellipsis.rectangle"), tag: 2)
        
        let settingsViewController = SettingsViewController()
        let settingsNavVC = UINavigationController(rootViewController: settingsViewController)
        settingsNavVC.tabBarItem = UITabBarItem(title: K.Copy.navSettings, image: UIImage(systemName: "person.fill"), tag: 3)

        let naviVC = UITabBarController()
        naviVC.viewControllers = [navController, logNavVC, settingsNavVC]
        naviVC.selectedIndex = 2 // !!!!!
        return naviVC
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

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

