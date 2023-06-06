//
//  MapView.swift
//  Africa
//
//  Created by Iwy2th on 6/4/23.
//

import SwiftUI
import MapKit

struct MapView: View {
  // MARK: - PROPERTIES
  @State private var region: MKCoordinateRegion = {
    var mapCoordinate = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
    var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
    var mapRegion = MKCoordinateRegion(center: mapCoordinate, span: mapZoomLevel)
    return mapRegion
  }()
  let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
  // MARK: - BODY
  var body: some View {
//    // MARK: - No1 Basic Map
//    Map(coordinateRegion: $region)
    // MARK: - No2 Basic Map
    Map(coordinateRegion: $region, annotationItems: locations) { item in
    //  MapPin(coordinate: item.location, tint: .accentColor)
    //  MapMarker(coordinate: item.location, tint: .accentColor)
      MapAnnotation(coordinate: item.location) {
        Image("logo")
          .resizable()
          .scaledToFit()
          .frame(width: 32, height: 32, alignment: .center)
      }
    }


  }
}
// MARK: - PREVIEW
struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView()
  }
}
