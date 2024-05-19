//
//  AnimationStyle.swift
//  AnimationKit
//
//  Created by 이웅재(NuPlay) on 5/19/24.
//

import SwiftUI

public enum AnimationStyle {
  case `default`
  case grid
  case list
}

extension AnimationStyle: AnimatableStyle {
  public var opacity: AnimationValue<CGFloat> {
    return config.opacity
  }

  public var offsetX: AnimationValue<CGFloat> {
    return config.offsetX
  }

  public var offsetY: AnimationValue<CGFloat> {
    return config.offsetY
  }

  public var rotation: AnimationValue<Double> {
    return config.rotation
  }

  public var scale: AnimationValue<Double> {
    return config.scale
  }

  public var blur: AnimationValue<Double> {
    return config.blur
  }

  public var delay: Double {
    return config.delay
  }

  public var animation: Animation {
    return config.animation
  }

  public var maxAnimationCount: Int {
    return config.maxAnimationCount
  }
}

extension AnimationStyle {
  var config: AnimationConfig {
    switch self {
    case .`default`:
      return AnimationConfig(
        opacity: .init(from: 0, to: 1),
        offsetX: .init(from: 0, to: 0),
        offsetY: .init(from: 50, to: 0),
        rotation: .init(from: 0, to: 0),
        scale: .init(from: 1.0, to: 1.0),
        blur: .init(from: 0, to: 0)
      )
    case .grid:
      return AnimationConfig(
        opacity: .init(from: 0, to: 1),
        offsetX: .init(from: 0, to: 0),
        offsetY: .init(from: 100, to: 0),
        rotation: .init(from: 0, to: 0),
        scale: .init(from: 1.3, to: 1.0),
        blur: .init(from: 8, to: 0)
      )
    case .list:
      return AnimationConfig(
        opacity: .init(from: 0, to: 1),
        offsetX: .init(from: 50, to: 0),
        offsetY: .init(from: 0, to: 0),
        rotation: .init(from: 0, to: 0),
        scale: .init(from: 1.1, to: 1.0),
        blur: .init(from: 0, to: 0)
      )
    }
  }
}
