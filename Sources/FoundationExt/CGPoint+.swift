import Foundation

extension CGPoint {
  // If the point is equal to another point, return nil
  // The priority is: right > left > up > down
  public func isInDirection(to: CGPoint) -> DirectionTopDownLeftRight? {
    let dx = to.x - self.x
    let dy = to.y - self.y

    var direction: DirectionTopDownLeftRight?

    if dx > 0 {
      direction = .right
    } else if dx < 0 {
      direction = .left
    }

    if dy > 0 {
      direction = .up
    } else if dy < 0 {
      direction = .down
    }

    return direction
  }
}
