//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by Iwy2th on 6/6/23.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
  if let videoPlayers = Bundle.main.url(forResource: fileName, withExtension: fileFormat) {
    videoPlayer = AVPlayer(url: videoPlayers)
    videoPlayer?.play()
  }
  return videoPlayer!
}
