//
//  AnalyticsEvent.swift
//  analytics-architecture
//
//  Created by Abdullah Al Hadi on 2/10/23.
//

import SwiftUI

enum AnalyticsEvent {
    case itemAdded(item: Item)
    case itemDeleted(index: Int)
    case homeViewLoaded
    case itemDetailsViewLoaded
    case secondViewLoaded
}

extension AnalyticsEvent {
    var name: String {
        switch self {
        case .itemAdded:
            return "new-item-added"
        case .itemDeleted:
            return "item-deleted"
        case .homeViewLoaded:
            return "home-view-loaded"
        case .itemDetailsViewLoaded:
            return "item-details-view-loaded"
        case .secondViewLoaded:
            return "second-view-loaded"
        }
    }
}

extension AnalyticsEvent {
    var metaData: [String: String] {
        switch self {
        case .itemAdded(let item):
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .long
            let itemText = dateFormatter.string(from: item.timestamp)
            return ["item-value": itemText]
        case .itemDeleted(let index):
            return ["item-value": "\(index)"]
        case .homeViewLoaded:
            return [:]
        case .itemDetailsViewLoaded:
            return [:]
        case .secondViewLoaded:
            return [:]
        }
    }
}
