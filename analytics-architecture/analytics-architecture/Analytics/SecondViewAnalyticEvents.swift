//
//  SecondViewAnalyticEvents.swift
//  analytics-architecture
//
//  Created by Abdullah Al Hadi on 2/10/23.
//

import Foundation

struct SecondViewAnalyticEvents: AnalyticsEvent {
    var name: String
    var metaData: [String : String] = [:]
    
    static func secondViewLoaded() -> AnalyticsEvent {
        ContentAnalyticEvents(name: "second-view-loaded")
    }
}

class DetailItemAnalyticsEvent: AnalyticsEvent {
    var name: String
    var metaData: [String : String]
    
    init(name: String, metaData: [String : String] = [:]) {
        self.name = name
        self.metaData = metaData
    }

    static func itemDetailsViewLoaded() -> AnalyticsEvent {
        DetailItemAnalyticsEvent(name: "item-details-view-loaded")
    }
}
