//
//  AnimationConfig.swift
//  AnimationKit
//
//  Created by 이웅재(NuPlay) on 5/19/24.
//

import SwiftUI

public struct AnimationConfig: Hashable, Equatable, AnimatableStyle {
  public var opacity: AnimationValue<CGFloat>
  public var offsetX: AnimationValue<CGFloat>
  public var offsetY: AnimationValue<CGFloat>
  public var rotation: AnimationValue<Double>
  public var scale: AnimationValue<Double>
  public var blur: AnimationValue<Double>
  public var delay: Double
  public var animation: Animation
  public var maxAnimationCount: Int

  public init(
    opacity: AnimationValue<CGFloat>,
    offsetX: AnimationValue<CGFloat>,
    offsetY: AnimationValue<CGFloat>,
    rotation: AnimationValue<Double>,
    scale: AnimationValue<Double>,
    blur: AnimationValue<Double>,
    delay: Double = 0.05,
    animation: Animation = .bouncy(duration: 0.4),
    maxAnimationCount: Int = 20
  ) {
    self.opacity = opacity
    self.offsetX = offsetX
    self.offsetY = offsetY
    self.rotation = rotation
    self.scale = scale
    self.blur = blur
    self.delay = delay
    self.animation = animation
    self.maxAnimationCount = maxAnimationCount
  }
}
