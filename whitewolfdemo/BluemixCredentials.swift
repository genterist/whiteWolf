//
//  BluemixCredentials.swift
//  Whitewolfdemo
//
//  This App has been generated using IBM Mobile UI Builder
//

import Foundation

class BluemixCredentials {

    static let sharedInstance = BluemixCredentials()
    
    private enum key {
        
        static let resource = "credentials"
        
        static let analyticsApiKey = "AnalyticsApiKey"
        static let pushAppGuid = "PushAppGuid"
        static let pushClientSecret = "PushClientSecret"
        static let region = "Region"
    }
    
    var data: [String: AnyObject]?
    
    var analyticsApiKey: String?
    var pushAppGuid: String?
    var pushClientSecret: String?
    var region: String?
    
    init() {
        
        if let path = NSBundle.mainBundle().pathForResource(key.resource, ofType: "plist"), dict = NSDictionary(contentsOfFile: path) as? [String: AnyObject] {
            
            analyticsApiKey = dict[key.analyticsApiKey] as? String
            pushAppGuid = dict[key.pushAppGuid] as? String
            pushClientSecret = dict[key.pushClientSecret] as? String
            region = dict[key.region] as? String
        }
    }
}
