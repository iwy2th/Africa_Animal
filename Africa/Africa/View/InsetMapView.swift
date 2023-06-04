//
//  InsetMapView.swift
//  Africa
//
//  Created by Iwy2th on 6/5/23.
//

import SwiftUI
import MapKit
struct InsetMapView: View {
  // MARK: - PROPERTIES
  @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.44377599), span: MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0))
  // MARK: - BODY
    var body: some View {
       Map(coordinateRegion: $region)
        .overlay(
          NavigationLink(destination: MapView(), label: {
            HStack {
              Image(systemName: "mappin.circle")
                .foregroundColor(Color.white)
                .imageScale(.large)
              Text("Location")
                .foregroundColor(.accentColor)
                .fontWeight(.bold)
            } //: HSTACK
            .padding(.vertical, 10)
            .padding(.horizontal, 14)
            .background(Color.black
              .opacity(0.4)
              .cornerRadius(8)
            )
          })//: NAVIGATION
            .padding(12), alignment: .topTrailing

        )
        .frame(height: 256)
        .cornerRadius(16)
    }
}

struct InsetMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsetMapView()
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
