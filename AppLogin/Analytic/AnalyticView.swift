//
//  AnalyticView.swift
//  AppLogin
//
//  Created by Dwi Fauzi on 20/11/23.
//

import SwiftUI
import FirebaseAnalytics
import FirebaseAnalyticsSwift

final class AnalyticsManager {
    static let shared = AnalyticsManager()
    
    private init () {}
    
    func logEvent(name:String, params: [String:Any]? = nil) {
        Analytics.logEvent(name, parameters: params)
    }
    
    func setUserId(userId: String) {
        Analytics.setUserID(userId)
    }
    
    func setUserProperty(value: String, property: String) {
        Analytics.setUserProperty(value, forName: property)
    }
}

struct AnalyticView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    AnalyticView()
}
