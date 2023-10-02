//
//  AnalyticsEngine.swift
//  analytics-architecture
//
//  Created by Abdullah Al Hadi on 2/10/23.
//

import Foundation

protocol AnalyticsEngine {
    func send(name: String, metaData: [String: String])
}
