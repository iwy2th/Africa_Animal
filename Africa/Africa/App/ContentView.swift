//
//  ContentView.swift
//  Africa
//
//  Created by Iwy2th on 6/4/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      NavigationView {
        List {
          CoverImageView()
            .frame(height: 300)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Africa")
        .navigationBarTitleDisplayMode(.large)
      } //: NAVIGATION
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
