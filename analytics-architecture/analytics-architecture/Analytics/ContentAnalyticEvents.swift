//
//  ContentAnalyticEvents.swift
//  analytics-architecture
//
//  Created by Abdullah Al Hadi on 2/10/23.
//

import Foundation

struct ContentAnalyticEvents: AnalyticsEvent {
    var name: String
    var metaData: [String : String] = [:]

    static func itemAdded(item: Item) -> ContentAnalyticEvents {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        let itemText = dateFormatter.string(from: item.timestamp)
        return ContentAnalyticEvents(name: "new-item-added", metaData: ["added-item": itemText])
    }
    
    static func itemDeleted(index: Int) -> ContentAnalyticEvents {
        return ContentAnalyticEvents(name: "new-item-added", metaData: ["deleted-item": "\(index)"])
    }

    static func homeViewLoaded() -> ContentAnalyticEvents {
        ContentAnalyticEvents(name: "home-view-loaded")
    }

}
