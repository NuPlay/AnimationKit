//
//  ArrayViewBuilder+.swift
//  AnimationKit
//
//  Created by 이웅재(NuPlay) on 3/25/25.
//

import SwiftUICore

@resultBuilder
public struct ArrayViewBuilder {
  public static func buildBlock(_ components: AnyView...) -> [AnyView] {
    components
  }
  
  public static func buildExpression<V: View>(_ expression: V) -> AnyView {
    AnyView(expression)
  }
  
  public static func buildOptional(_ component: [AnyView]?) -> [AnyView] {
    component ?? []
  }
  
  public static func buildEither(first component: [AnyView]) -> [AnyView] {
    component
  }
  
  public static func buildEither(second component: [AnyView]) -> [AnyView] {
    component
  }
  
  public static func buildArray(_ components: [[AnyView]]) -> [AnyView] {
    components.flatMap { $0 }
  }
}
