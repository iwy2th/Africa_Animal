//
//  VideoModel.swift
//  Africa
//
//  Created by Iwy2th on 6/5/23.
//

import SwiftUI

struct Video: Identifiable, Codable {
  let id: String
  let name: String
  let headline: String

  // Computed Property
  var thumbnail: String {
    "video-\(id)"
  }
}
