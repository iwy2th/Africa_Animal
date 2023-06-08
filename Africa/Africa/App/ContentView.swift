//
//  ContentView.swift
//  Africa
//
//  Created by Iwy2th on 6/4/23.
//

import SwiftUI

struct ContentView: View {
  // MARK: - PROPERTIES
  let animals: [Animal] = Bundle.main.decode("animals.json")
  let haptics = UIImpactFeedbackGenerator(style: .medium)
  //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
  @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
  @State private var gridColumn: Int = 1
  @State private var toolbarIcon: String = "square.grid.2x2"
  @State private var isGridViewActive: Bool = false
  // MARK: - FUNCTIONS
  func gridSwitch() {
    gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1 )
    gridColumn = gridLayout.count
    print(gridColumn)
    switch gridColumn {
    case 1: toolbarIcon = "square.grid.2x2"
    case 2: toolbarIcon = "square.grid.3x2"
    case 3: toolbarIcon = "rectangle.grid.1x2"
    default: toolbarIcon = "square.grid.2x2"
    }
  }
  // MARK: - BODY
  var body: some View {
    NavigationView {
      Group {
        if !isGridViewActive {
          List {
            CoverImageView()
              .frame(height: 300)
              .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            ForEach(animals) { animal in
              NavigationLink(destination: AnimalDetailView(animal: animal)) {
                AnimalListItemView(animal: animal)
              }
            }
          }//: LIST
          .listStyle(.plain)
        } else {
          ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
              ForEach(animals) { animal in
                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                  AnimalGridItemView(animal: animal)
                }//: LINK
              }//: LOOP
            } //: GRID
            .padding(10)
          
          }//: SCROLL
        }//: CONDITION
      }//: GROUP
      .listStyle(PlainListStyle())
      .navigationTitle("Africa")
      .navigationBarTitleDisplayMode(.large)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          HStack(spacing: 16) {
            //LIST
            Button {
              isGridViewActive = false
              haptics.impactOccurred()
            } label: {
              Image(systemName: "square.fill.text.grid.1x2")
                .font(isGridViewActive ? .title2 : .title)
                .foregroundColor(isGridViewActive ? .primary : .accentColor)
            }
            //GRID
            Button {
              isGridViewActive = true
           haptics.impactOccurred()
              gridSwitch()
            } label: {
              Image(systemName: toolbarIcon)
                .font(isGridViewActive ? .title : .title2)
                .foregroundColor(isGridViewActive ? .accentColor : .primary)
            }

          }//: HSTACK
        }
      }
    } //: NAVIGATION
    .navigationViewStyle(StackNavigationViewStyle())
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
