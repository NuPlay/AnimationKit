//
//  TupleView+.swift
//  AnimationKit
//
//  Created by 이웅재(NuPlay) on 5/19/24.
//

import SwiftUI

extension TupleView {
  var childViews: [AnyView] {
    return Mirror(reflecting: value).children.compactMap { child in
      if let view = child.value as? (any View) {
        return AnyView(view)
      } else if let view = child.value as? AnyView {
        return view
      }
      return nil
    }
  }
}
