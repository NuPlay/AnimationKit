//
//  AnimatableStyle.swift
//  AnimationKit
//
//  Created by 이웅재(NuPlay) on 5/19/24.
//

import SwiftUI

public protocol AnimatableStyle {
  var opacity: AnimationValue<CGFloat> { get }
  var offsetX: AnimationValue<CGFloat> { get }
  var offsetY: AnimationValue<CGFloat> { get }
  var rotation: AnimationValue<Double> { get }
  var scale: AnimationValue<Double> { get }
  var blur: AnimationValue<Double> { get }
  var delay: Double { get }
  var animation: Animation { get }
  var maxAnimationCount: Int { get }
}
