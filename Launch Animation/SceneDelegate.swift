//
//  SceneDelegate.swift
//  Launch Animation
//
//  Created by Billow on 2020/2/14.
//  Copyright © 2020 Billow Wang. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let scene = (scene as? UIWindowScene) else { return }
        
        self.window?.windowScene = scene
        
        let view = window?.rootViewController?.view
        
        let logoLayer = CALayer()
        logoLayer.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)
        logoLayer.position = view!.center
        logoLayer.contents = UIImage(named: "logo")?.cgImage
        view!.layer.mask = logoLayer
        
        let shelterView = UIView(frame: view!.frame)
        shelterView.backgroundColor = .white
        view!.addSubview(shelterView)
        window!.backgroundColor = UIColor(red: 29 / 255.0, green: 161 / 255.0, blue: 242 / 255.0, alpha: 1)
        
        // Layer 缩放动画
        let logoAnimation = CAKeyframeAnimation(keyPath: "bounds")
        // 开始的时间
        logoAnimation.beginTime = CACurrentMediaTime()+1
        // 持续的时间
        logoAnimation.duration = 0.5
        logoAnimation.keyTimes = [0, 0.4, 1]
        logoAnimation.values = [NSValue(cgRect: CGRect(x: 0, y: 0, width: 100, height: 100)),
                                NSValue(cgRect: CGRect(x: 0, y: 0, width: 80, height: 80)),
                                NSValue(cgRect: CGRect(x: 0, y: 0, width: 4500, height: 4500))]
        logoAnimation.timingFunctions = [CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeOut),
                                        CAMediaTimingFunction(name:CAMediaTimingFunctionName.default)]
        logoAnimation.isRemovedOnCompletion = false
        logoAnimation.fillMode = CAMediaTimingFillMode.forwards
        logoLayer.add(logoAnimation, forKey: "zoomAnimation")


        
        // MainView 缩放动画
//        let mainViewAnimation = CAKeyframeAnimation(keyPath: "transform")
//        mainViewAnimation.beginTime = CACurrentMediaTime()
//        mainViewAnimation.duration = 0.6
//        mainViewAnimation.keyTimes = [0, 0.5, 1]
//        mainViewAnimation.values = [NSValue(caTransform3D: CATransform3DIdentity),
//                                    NSValue(caTransform3D: CATransform3DScale(CATransform3DIdentity, 1.1, 1.1, 1)),
//                                    NSValue(caTransform3D: CATransform3DIdentity)]
//        view!.layer.add(mainViewAnimation, forKey: "transformAnimation")
//        view!.layer.transform = CATransform3DIdentity
        
        // 调整透明度
        UIView.animate(withDuration: 0.3, delay: 1, options: .curveLinear, animations: {
            shelterView.alpha = 0}) { (_) in
            shelterView.removeFromSuperview()
                view!.layer.mask = nil
                
        }

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

