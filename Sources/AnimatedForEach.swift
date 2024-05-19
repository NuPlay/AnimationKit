//
//  AnimatedForEach.swift
//  AnimationKit
//
//  Created by 이웅재(NuPlay) on 5/19/24.
//

import SwiftUI

public struct AnimatedForEach<Data, Content>: View where Data: Hashable, Content: View {
  private let data: [Data]
  private let content: (Data) -> Content
  private let preset: AnimatableStyle

  @State private var didAppear: Bool = false
  @State private var animations: [Bool] = []

  public init(
    _ data: [Data],
    preset: AnimatableStyle,
    @ViewBuilder content: @escaping (Data) -> Content
  ) {
    self.data = data
    self.preset = preset
    self.content = content
    self._animations = State(initialValue: Array(repeating: false, count: data.count))
  }

  public init(
    _ data: [Data],
    preset: AnimationStyle = .default,
    @ViewBuilder content: @escaping (Data) -> Content
  ) {
    self.data = data
    self.preset = preset
    self.content = content
    self._animations = State(initialValue: Array(repeating: false, count: data.count))
  }

  public var body: some View {
    ForEach(data.indices, id: \.self) { i in
      if data[safe: i] != nil, animations[safe: i] != nil {
        content(data[i])
          .opacity(animations[i] ? preset.opacity.to : preset.opacity.from)
          .blur(radius: animations[i] ? preset.blur.to : preset.blur.from)
          .offset(
            x: animations[i] ? preset.offsetX.to : preset.offsetX.from,
            y: animations[i] ? preset.offsetY.to : preset.offsetY.from
          )
          .scaleEffect(animations[i] ? preset.scale.to : preset.scale.from)
          .rotationEffect(.degrees(animations[i] ? preset.rotation.to : preset.rotation.from))
          .animation(preset.animation, value: animations[i])
      }
    }
    .onAppear {
      guard !didAppear else { return }
      didAppear = true
      animateSequence()
    }
    .onChange(of: data) { newValue in
      let oldValueCount = animations.count
      let newValueCount = newValue.count

      if oldValueCount > newValueCount {
        animations.removeLast(oldValueCount - newValueCount)
      } else if oldValueCount < newValueCount {
        animations.append(contentsOf: Array(repeating: true, count: newValueCount - oldValueCount))
      }
    }
  }

  private func animateSequence() {
    DispatchQueue.main.async {
      for index in data.indices {
        guard index < preset.maxAnimationCount else { break }
        DispatchQueue.main.asyncAfter(deadline: .now() + preset.delay * Double(index)) {
          withAnimation(preset.animation) {
            animations[index] = true
          }
          if index == min(data.count - 1, preset.maxAnimationCount - 1) {
            DispatchQueue.main.asyncAfter(deadline: .now() + preset.delay) {
              self.animations = Array(repeating: true, count: data.count)
            }
          }
        }
      }
    }
  }
}
