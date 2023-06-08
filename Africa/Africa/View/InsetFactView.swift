//
//  InsetFactView.swift
//  Africa
//
//  Created by Iwy2th on 6/5/23.
//

import SwiftUI

struct InsetFactView: View {
  // MARK: - PROPERTIES
  let animal: Animal
  // MARK: - BODY
  var body: some View {
    GroupBox {
      TabView {
        ForEach(animal.fact, id: \.self) { item in
          Text(item)
        }
      }//: TABVIEW
      .tabViewStyle(PageTabViewStyle())
      
      .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
    }//: BOX
  }
}
// MARK: - PREVIEW
struct InsetFactView_Previews: PreviewProvider {
  static let animal: [Animal] = Bundle.main.decode("animals.json")
  static var previews: some View {
    InsetFactView(animal: animal[4])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
