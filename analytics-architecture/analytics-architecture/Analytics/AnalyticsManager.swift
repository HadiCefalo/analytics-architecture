//
//  AnalyticsManager.swift
//  analytics-architecture
//
//  Created by Abdullah Al Hadi on 2/10/23.
//

import Foundation

class AnalyticsManager {

    static let shared = AnalyticsManager(engine: PrintAnalyticsEngine())

    let engine: AnalyticsEngine

    init(engine: AnalyticsEngine) {
        self.engine = engine
    }

    func log(event: AnalyticsEvent) {
        engine.send(name: event.name, metaData: event.metaData)
    }
}
