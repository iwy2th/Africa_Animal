//
//  AnimalModel.swift
//  Africa
//
//  Created by Iwy2th on 6/4/23.
//

import SwiftUI
struct Animal: Identifiable, Codable {
  let id: String
  let name: String
  let headline: String
  let description: String
  let link: String
  let image: String
  let gallery: [String]
  let fact: [String] 
}
