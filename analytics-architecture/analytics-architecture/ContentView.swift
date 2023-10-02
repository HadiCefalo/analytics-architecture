//
//  ContentView.swift
//  analytics-architecture
//
//  Created by Abdullah Al Hadi on 2/10/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                            .navigationTitle("Item Detail")
                            .onAppear {
                                AnalyticsManager.shared.log(event: DetailItemAnalyticsEvent.itemDetailsViewLoaded())
                            }
                    } label: {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(
                        destination: MySecondView(),
                        label: {
                            Text("2nd View")
                        })
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }.navigationBarTitle("Home")
        } detail: {
            Text("Select an item")
        }.onAppear {
            AnalyticsManager.shared.log(event: ContentAnalyticEvents.homeViewLoaded())
        }.navigationBarTitle("Home View")
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            AnalyticsManager.shared.log(event: ContentAnalyticEvents.itemAdded(item: newItem))
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
                AnalyticsManager.shared.log(event: ContentAnalyticEvents.itemDeleted(index: index))
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
