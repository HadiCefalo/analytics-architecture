//
//  MySecondView.swift
//  analytics-architecture
//
//  Created by Abdullah Al Hadi on 2/10/23.
//

import SwiftUI

struct MySecondView: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationSplitView {
            Spacer()
            Text("How are you ?")

            Spacer()

            Button("I am fine") {
                dismiss()
            }
            Spacer()
        } detail: {
            Text("Select an item")
        }.onAppear {
            AnalyticsManager.shared.log(event: .secondViewLoaded)
        }.navigationTitle("Second View")
    }
}

#Preview {
    MySecondView()
}
