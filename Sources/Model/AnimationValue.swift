//
//  AnimationValue.swift
//  AnimationKit
//
//  Created by 이웅재(NuPlay) on 5/19/24.
//

import SwiftUI

public struct AnimationValue<T: Hashable & Equatable>: Hashable, Equatable {
  public var from: T
  public var to: T
  
  public init(from: T, to: T) {
    self.from = from
    self.to = to
  }
}
