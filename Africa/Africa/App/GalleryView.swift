//
//  GalleryView.swift
//  Africa
//
//  Created by Iwy2th on 6/4/23.
//

import SwiftUI
struct GalleryView: View {
  // MARK: - PROPERTIES
  @State private var selectedAnimal: String = "lion"
  let animals: [Animal] = Bundle.main.decode("animals.json")
  let haptics = UIImpactFeedbackGenerator(style: .medium)
  // SIMPLE GRID DEFINITION
  //let girdLayout: [GridItem] = [
  //  GridItem(.flexible()),
  //  GridItem(.flexible()),
  //  GridItem(.flexible())
  //]
  //EFFICIENT FRID DEFINITION
  //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
  //DYNAMIC GRID LAYOUT
  @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
  @State private var gridColumn: Double = 3.0
  @State private var isAnimating = false

  func gridSwitch() {
    gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
  }
  // MARK: - BODY
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      // MARK: - IMAGE
      Image(selectedAnimal)
        .resizable()
        .scaledToFit()
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.white, lineWidth: 8))
      // MARK: - SLIDER
      Slider(value: $gridColumn, in: 2...4, step: 1, onEditingChanged: { value in
        withAnimation(.easeIn) {
          gridSwitch()
        }
      })
      .padding()

      // MARK: - GRID
      VStack(alignment: .center, spacing: 30) {
        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
          ForEach(animals) { item in
            Image(item.image)
              .resizable()
              .scaledToFit()
              .clipShape(Circle())
              .overlay(Circle().stroke(Color.white, lineWidth: 1))
              .onTapGesture {
                selectedAnimal = item.image
              }
          }//: LOOP
        }//: GRID
        .onAppear {
          gridSwitch()
          haptics.impactOccurred()
        }

      }//: VSTACK
      .padding(.horizontal, 10)
      .padding(.vertical, 50)
    }//: SCROLL
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(MotionAnimationView())
  }
}
// MARK: - PREVIEW
struct GalleryView_Previews: PreviewProvider {
  static var previews: some View {
    GalleryView()
  }
}
