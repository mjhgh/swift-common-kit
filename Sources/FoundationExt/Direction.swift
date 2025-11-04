public enum DirectionTopDownLeftRight {
  case up
  case down
  case left
  case right

  public var vector: (x: Int, y: Int) {
    switch self {
    case .up:
      return (0, 1)
    case .down:
      return (0, -1)
    case .left:
      return (-1, 0)
    case .right:
      return (1, 0)
    }
  }
}
public enum DirectionLeftRight {
  case left
  case right
  public var vector: (x: Int, y: Int) {
    switch self {
    case .left:
      return (-1, 0)
    case .right:
      return (1, 0)
    }
  }
}

public enum DirectionTopDown {
  case top
  case down
  public var vector: (x: Int, y: Int) {
    switch self {
    case .top:
      return (0, 1)
    case .down:
      return (0, -1)
    }
  }
}
