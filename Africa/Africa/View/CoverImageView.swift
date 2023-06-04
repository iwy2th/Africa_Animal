//
//  CoverImageView.swift
//  Africa
//
//  Created by Iwy2th on 6/4/23.
//

import SwiftUI

struct CoverImageView: View {
  // MARK: - PROPERTIES
  let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
  // MARK: - BODY
    var body: some View {
      TabView {
        ForEach(coverImages) { item in
          Image(item.name)
            .resizable()
            .scaledToFit()
        }
      }//: TABVIEW
      .tabViewStyle(PageTabViewStyle())
    }
}
// MARK: - PREVIEW
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
        .previewLayout(.fixed(width: 400, height: 300))
    }
}
