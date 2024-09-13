//
//  ContentView.swift
//  SwiftUImacOSTabViewContentBehindToolbar
//
//  Created by Simon Nickel on 13.09.24.
//

import SwiftUI

struct ContentView: View {
	
	@State private var selection: String = "A"
	
	var body: some View {
		TabView(selection: $selection) {
			
			tab(title: "A")
			tab(title: "B")
			tab(title: "C")

		}
		.tabViewStyle(.sidebarAdaptable)
	}
	
	@TabContentBuilder<String>
	func tab(title: String) -> some TabContent<String> {
		Tab(value: title, role: nil) {
			NavigationStack {
				ScrollView {
					VStack(alignment: .leading) {
						Text(title)
							.padding(20)
							.background(.orange)
						Spacer(minLength: 999)
					}
					.frame(maxWidth: .infinity, alignment: .leading)
				}
			}
		} label: {
			Text(title)
		}
	}
}

#Preview {
    ContentView()
}
