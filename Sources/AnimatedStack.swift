//
//  AnimatedStack.swift
//  AnimationKit
//
//  Created by 이웅재(NuPlay) on 5/19/24.
//

import SwiftUI

public struct AnimatedStack: View {
  private let preset: AnimatableStyle
  private let views: [AnyView]

  public init(
    preset: AnimatableStyle,
    @ArrayViewBuilder content: @escaping () -> [AnyView]
  ) {
    self.preset = preset
    views = content()
  }

  public init(
    preset: AnimationStyle = .default,
    @ArrayViewBuilder content: @escaping () -> [AnyView]
  ) {
    self.preset = preset
    views = content()
  }

  public var body: some View {
    AnimatedForEach(views.indices.map { $0 }, preset: preset) { index in
      if let view = views[safe: index] {
        view
      }
    }
  }
}
