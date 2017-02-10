//
//  BluemixPush
//  whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

import Foundation

import BMSCore
import BMSPush

@objc public class BluemixPush: NSObject {

    static let sharedInstance = BluemixPush()
    
    override init() {
        
        if BMSClient.sharedInstance.bluemixRegion == nil {
            
            // INIT BLUEMIX
            
            if let region = BluemixCredentials.sharedInstance.region {
                
                BMSClient.sharedInstance.initialize(bluemixRegion: region)
            }
        }
    }
    
    func registerPush(deviceToken: NSData) {
        
        guard let appGuid = BluemixCredentials.sharedInstance.pushAppGuid, clientSecret = BluemixCredentials.sharedInstance.pushClientSecret else {
            
            debugPrint("App guid or client secret are null" )
            
            return
        }
        
        let push =  BMSPushClient.sharedInstance
        
        push.initializeWithAppGUID(appGUID: appGuid, clientSecret: clientSecret)
        
        // REGISTERING DEVICE
        
        push.registerWithDeviceToken(deviceToken) { (response, statusCode, error) -> Void in
            
            if error.isEmpty {
                
                debugPrint("Response during device registration : \(response)")
                
                debugPrint("status code during device registration : \(statusCode)")
                
                // RETRIEVING AVAILABLE TAGS
                
                push.retrieveAvailableTagsWithCompletionHandler({ (response, statusCode, error) -> Void in
                    
                    if error.isEmpty {
                        
                        debugPrint("Response during retrive tags : \(response)")
                        
                        debugPrint("status code during retrieve tags : \(statusCode)")
                        
                        // SUBSCRIBING TO AVAILABLE TAGS
                        
                        push.subscribeToTags(response!, completionHandler: { (response, statusCode, error) -> Void in
                            
                            if error.isEmpty {
                                
                                debugPrint("Response during Subscribing to tags : \(response?.description)")
                                
                                debugPrint("status code during Subscribing tags : \(statusCode)")
                                
                                // RETRIEVING AVAILABLE SUBSCRIPTIONS
                                
                                push.retrieveSubscriptionsWithCompletionHandler({ (response, statusCode, error) -> Void in
                                    
                                    if error.isEmpty {
                                        
                                        debugPrint("Response during retrieving subscribed tags : \(response?.description)")
                                        
                                        debugPrint("status code during retrieving subscribed tags : \(statusCode)")
                                        
                                    } else {
                                        
                                        debugPrint("Error during retrieving subscribed tags \n  - status code: \(statusCode) \n Error :\(error) \n")
                                    }
                                })
                                
                            } else {
                                
                                debugPrint("Error during subscribing tags \n  - status code: \(statusCode) \n Error :\(error) \n")
                            }
                        })
                        
                    } else {
                        
                        debugPrint("Error during retrieve tags \n  - status code: \(statusCode) \n Error :\(error) \n")
                    }
                })
                
            } else {
                
                debugPrint("Error during device registration \n  - status code: \(statusCode) \n Error :\(error) \n")
            }
        }
    }
    
    func unregisterPush () {
        
        // RETRIEVING AVAILABLE SUBSCRIPTIONS
        
        let push =  BMSPushClient.sharedInstance
        
        push.retrieveSubscriptionsWithCompletionHandler { (response, statusCode, error) -> Void in
            
            if error.isEmpty {
                
                debugPrint("Response during retrieving subscribed tags : \(response?.description)")
                
                debugPrint("status code during retrieving subscribed tags : \(statusCode)")
                
                // UNSUBSCRIBING TO TAGS
                
                push.unsubscribeFromTags(response!, completionHandler: { (response, statusCode, error) -> Void in
                    
                    if error.isEmpty {
                        
                        debugPrint("Response during unsubscribed tags : \(response?.description)")
                        
                        debugPrint("status code during unsubscribed tags : \(statusCode)")
                        
                        // UNSREGISTER DEVICE
                        
                        push.unregisterDevice({ (response, statusCode, error) -> Void in
                            
                            if error.isEmpty {
                                
                                debugPrint("Response during unregistering device : \(response)")
                                
                                debugPrint("status code during unregistering device : \(statusCode)")
                                
                                UIApplication.sharedApplication().unregisterForRemoteNotifications()
                                
                            } else {
                                
                                debugPrint("Error during unregistering device \n  - status code: \(statusCode) \n Error :\(error) \n")
                            }
                        })
                        
                    } else {
                        
                        debugPrint("Error during unsubscribed tags \n  - status code: \(statusCode) \n Error :\(error) \n")
                    }
                })
                
            } else {
                
                debugPrint("Error during retrieving subscribed tags \n  - status code: \(statusCode) \n Error :\(error) \n")
            }
        }
    }
}
