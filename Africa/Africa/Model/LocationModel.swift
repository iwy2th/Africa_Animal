//
//  LocationModel.swift
//  Africa
//
//  Created by Iwy2th on 6/6/23.
//

import SwiftUI
import MapKit
struct NationalParkLocation: Identifiable, Codable {
  let id: String
  let name: String
  let image: String
  var latitude: Double
  var longitude: Double

  //COMPUTER PROPERTY
  var location: CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }
}
