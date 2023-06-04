//
//  ContentView.swift
//  Africa
//
//  Created by Iwy2th on 6/4/23.
//

import SwiftUI

struct ContentView: View {
  let animals: [Animal] = Bundle.main.decode("animals.json")
    var body: some View {
      NavigationView {
        List {
          CoverImageView()
            .frame(height: 300)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
          ForEach(animals) { animal in
            NavigationLink(destination: AnimalDetailView(animal: animal)) {
              AnimalListItemView(animal: animal)
            }
          }
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
