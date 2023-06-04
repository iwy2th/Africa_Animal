//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Iwy2th on 6/5/23.
//

import SwiftUI

struct InsetGalleryView: View {
  // MARK: - PROPERTIES
  let animal: Animal
  // MARK: - BODY
  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(alignment: .center, spacing: 15) {
        ForEach(animal.gallery, id: \.self) { item in
          Image(item)
            .resizable()
            .scaledToFit()
            .frame( height: 200)
          .cornerRadius(12)
        }
      }//: HSTACK
    }//: SCROLL
  }
}
// MARK: - PREVIEW
struct InsetGalleryView_Previews: PreviewProvider {
  static let animal: [Animal] = Bundle.main.decode("animals.json")
  static var previews: some View {
    InsetGalleryView(animal: animal[2])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
