//
//  SceneDelegate.swift
//  i-LeanAppAssessment
//
//  Created by Harsha R Mundaragi on 06/12/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

//    var plistHelp01 = PlistManagment()

    var userHelp = UserDefaults()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        
        
//        let skipStatusIs = plistHelp01.readPlist(namePlist: "SkipStatus", key: "StatusManager")
//        
//        if skipStatusIs as! Decimal == 1{
//            
//            let mainStory: UIStoryboard = UIStoryboard(name: "main", bundle: nil)
//
//            let signInPage = mainStory.instantiateViewController(withIdentifier: "SignInViewController") as? SignInViewController
//
//            if let vc = signInPage{
//                
//                self.window?.rootViewController = vc
//
//            }
//
//            
//        }
        
        
        let valueIs = userHelp.value(forKey: "Status")
        
        if (valueIs != nil) == true{
            
            let mainStory: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let signInPage = mainStory.instantiateViewController(withIdentifier: "TabBarViewController") as? TabBarViewController
            
            if let vc = signInPage{
                
                self.window?.rootViewController = vc
                
            }
            
            
            
        }else{
            
        }
        
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
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

