//
//  VideoListView.swift
//  Africa
//
//  Created by Iwy2th on 6/4/23.
//

import SwiftUI

struct VideoListView: View {
  // MARK: - PROPERTIES
  @State var videos: [Video] = Bundle.main.decode("videos.json")
  let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
  // MARK: - BODY
    var body: some View {
      NavigationView {
        List {
          ForEach(videos) { item in
            NavigationLink(destination: VideoPlayerView(videoName: item.id, videoTitle: item.name)) {
              VideoListItemView(video: item)
                .padding(.vertical, 8)
            }//: NAVIGATION
          }//: LOOP
        }//: LIST
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Videos")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
          ToolbarItem(placement: .navigationBarTrailing) {
            Button {
              videos.shuffle()
              hapticImpact.impactOccurred()
            } label: {
              Image(systemName: "arrow.2.squarepath")
            }

          }
        }
      }//: NAVIGATION
    }
}
// MARK: - PREVIEW
struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
