//
//  GalleryView.swift
//  Africa
//
//  Created by Iwy2th on 6/4/23.
//

import SwiftUI

struct GalleryView: View {
  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      Text("sda")
    }//: SCROLL
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(MotionAnimationView())
  }
}

struct GalleryView_Previews: PreviewProvider {
  static var previews: some View {
    GalleryView()
  }
}
