//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Iwy2th on 6/6/23.
//

import SwiftUI
import AVKit


struct VideoPlayerView: View {
  // MARK: - PROPERTIES
  var videoName: String
  var videoTitle: String

  // MARK: - BODY
    var body: some View {
      VStack {
        VideoPlayer(player: playVideo(fileName: videoName, fileFormat: "mp4")){
        }
        .overlay(alignment: .topLeading) {
          Image("logo")
            .resizable()
            .scaledToFit()
            .frame(width: 32, height: 32)
            .padding(.horizontal, 8)

        }
      }//: VSTACK
      .navigationTitle(videoTitle)
         .navigationBarTitleDisplayMode(.inline)
    }
}
// MARK: - PREVIEW
struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
      NavigationView {
        VideoPlayerView(videoName: "cheetah", videoTitle: "Lion")
      }
    }
}
