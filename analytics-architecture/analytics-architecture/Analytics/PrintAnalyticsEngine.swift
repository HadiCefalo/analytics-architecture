//
//  PrintAnalyticsEngine.swift
//  analytics-architecture
//
//  Created by Abdullah Al Hadi on 2/10/23.
//

import Foundation

class PrintAnalyticsEngine: AnalyticsEngine {
    func send(name: String, metaData: [String : String]) {
        debugPrint("Event name: \(name)")
        debugPrint("MetaData")
        for (key, value) in metaData {
            debugPrint("\(key) : \(value)")
        }
    }
}
