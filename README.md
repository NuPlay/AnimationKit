# AnimationKit
<img src="https://github.com/NuPlay/AnimationKit/assets/73557895/0d3459be-8158-451b-a9b3-d4f32223de49" align="right" width="300"/>

<p>
    <a href="https://www.apple.com/ios/">
        <img src="https://img.shields.io/badge/iOS-14.0+-007AFF?labelColor=303840" alt="iOS: 14.0+">
    </a>
    <a href="https://www.apple.com/macos/">
        <img src="https://img.shields.io/badge/macOS-11.0+-007AFF?labelColor=303840" alt="macOS-11.0+">
    </a>
</p>

### Swift Package Manager
```swift
dependencies: [
    .package(url: "https://github.com/NuPlay/AnimationKit.git", .upToNextMinor(from: "1.0.0"))
]
```

# Usage
### When creating a simple view
```swift
import SwiftUI
import AnimationKit

struct AnimationKit_Test: View {
  var body: some View {
    VStack {
      AnimatedStack(preset: .default) {
        Text("Hello, World!")
          .font(.title)
        Text("This is Simple Stack View")
          .font(.title2)
        Rectangle()
          .fill(Color.blue)
          .frame(width: 100, height: 100)
      }
    }
  }
}
```

### When using ForEach
```swift
import SwiftUI
import AnimationKit

struct AnimationKit_Test: View {
  @State private var emojiData: [String] = ["🚀", "🛸", "🛰", "🌌", "🌠", "🌟", "🌕", "🌍", "🪐", "🌑", "🌒", "🌓", "🌔", "🌖", "🌗", "🌘", "🌙", "🌚", "🌝", "🌞"]
  
  var body: some View {
    VStack {
      AnimatedForEach(emojiData, preset: .list) { emoji in
        Text(emoji)
          .font(.system(size: 100))
      }
    }
  }
}
```

# CustomAnimation
### You need to adopt the AnimatableStyle protocol.
```swift
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
```
### You can create a struct that adopts the protocol as shown below.
```swift
struct YourCustomAnimationConfig: AnimatableStyle {
  var opacity: AnimationValue<CGFloat> = .init(from: 0, to: 1)
  var offsetX: AnimationValue<CGFloat> = .init(from: 0, to: 0)
  var offsetY: AnimationValue<CGFloat> = .init(from: 50, to: 0)
  var rotation: AnimationValue<Double> = .init(from: 0, to: 0)
  var scale: AnimationValue<Double> = .init(from: 1, to: 1)
  var blur: AnimationValue<Double> = .init(from: 8, to: 0)
  var delay: Double = 0.05
  var animation: Animation = .bouncy(duration: 0.4)
  var maxAnimationCount: Int = 20
}
```
```swift
AnimatedForEach(emojiData, preset: YourCustomAnimationConfig()) { emoji in

}
```

### You can modify the values of AnimationConfig as needed.
```swift
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
```

### Explanation of `AnimatableStyle` Variables
| Variable            | Type                       | Description                                                                                             |
|---------------------|----------------------------|---------------------------------------------------------------------------------------------------------|
| `opacity`           | `AnimationValue<CGFloat>`  | Defines the animation values for opacity.                                                               |
| `offsetX`           | `AnimationValue<CGFloat>`  | Defines the animation values for horizontal offset.                                                     |
| `offsetY`           | `AnimationValue<CGFloat>`  | Defines the animation values for vertical offset.                                                       |
| `rotation`          | `AnimationValue<Double>`   | Defines the animation values for rotation.                                                              |
| `scale`             | `AnimationValue<Double>`   | Defines the animation values for scaling.                                                               |
| `blur`              | `AnimationValue<Double>`   | Defines the animation values for blur effect.                                                           |
| `delay`             | `Double`                   | Determines the delay before each animation starts.                                                      |
| `animation`         | `Animation`                | Set to your desired animation type.                                                                     |
| `maxAnimationCount` | `Int`                      | Maximum number of animations to play.                                                                   |
|                     |                            | If set to 20, animations play up to the 20th item (index 19) according to the delay.                    |
|                     |                            | The 21st and subsequent items will animate simultaneously with the 21st.                                |
|                     |                            | This prevents excessive delays when animating large sets of data.                                       |
|                     |                            | For example, without this option, you would need to wait `delay * 99` seconds to see the 100th item.    |

<img src="https://github.com/NuPlay/AnimationKit/assets/73557895/e1b686be-fc96-4a84-a119-10cc432ceb1c" align="right" width="300"/>

### AnimationStyle Preset
```swift
var delay: Double = 0.05,
var animation: Animation = .bouncy(duration: 0.4),
var maxAnimationCount: Int = 20

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
```
