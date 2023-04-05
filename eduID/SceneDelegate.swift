/*
 * Copyright (c) 2010-2011 SURFnet bv
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 * 3. Neither the name of SURFnet bv nor the names of its contributors
 *    may be used to endorse or promote products derived from this
 *    software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
 * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 * GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER
 * IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
 * IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import UIKit
import Tiqr
import EduIDExpansion
import OpenAPIClient

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = EduIDExpansion.shared.attachViewController()
        window?.makeKeyAndVisible()
        
        let flowType = OnboardingManager.shared.getAppropriateLaunchOption()
        EduIDExpansion.shared.run(option: flowType)

        if let url = connectionOptions.urlContexts.first?.url {
            Tiqr.shared.startChallenge(challenge: url.absoluteString)
        }
    }

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        handleURLFromRedirect(url: URLContexts.first?.url)
    }
    
    func handleURLFromRedirect(url: URL?) {
        guard let url = url else { return }
        
        //TODO: check
        if url.absoluteString.range(of: "tiqrauth") != nil {
            Tiqr.shared.startChallenge(challenge: url.absoluteString)
        } else if let range = url.absoluteString.range(of: "created"), range != nil {
            NotificationCenter.default.post(name: .createEduIDDidReturnFromMagicLink, object: nil)
        } else if let range = url.absoluteString.range(of: "oauth-redirect"), range != nil {
            if let authorizationFlow = AppAuthController.shared.currentAuthorizationFlow,
               authorizationFlow.resumeExternalUserAgentFlow(with: url) {
                AppAuthController.shared.currentAuthorizationFlow = nil
            }
            
            // - check if this is a first time authorization to onboard the app
            if OnboardingManager.shared.getAppropriateLaunchOption() == .newUser {
                NotificationCenter.default.post(name: .firstTimeAuthorizationComplete, object: nil)
            } else if OnboardingManager.shared.getAppropriateLaunchOption() == .existingUserWithSecret {
                NotificationCenter.default.post(name: .firstTimeAuthorizationCompleteWithSecretPresent, object: nil)
            }
            return
            
        } else if let range = url.absoluteString.range(of: "account-linked"), range != nil {
            NotificationCenter.default.post(name: .didAddLinkedAccounts, object: nil)
        }
    }
    
    func scene(_ scene: UIScene, continue userActivity: NSUserActivity) {
        handleURLFromRedirect(url: userActivity.webpageURL)
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

