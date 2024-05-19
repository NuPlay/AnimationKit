//
//  Array+.swift
//  AnimationKit
//
//  Created by 이웅재(NuPlay) on 5/19/24.
//

import Foundation

extension Collection {
  subscript (safe index: Index) -> Element? {
    return indices.contains(index) ? self[index] : nil
  }
}
