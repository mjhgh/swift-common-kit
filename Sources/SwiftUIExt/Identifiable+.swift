extension Collection where Element: Identifiable {
  public subscript(id id: Element.ID) -> Element? {
    get {
      first { $0.id == id }
    }
  }

}

extension Array where Element: Identifiable {
  public mutating func updateOrInsert(id: Self.Element.ID, with: (inout Element?) -> Void) {
    let index = firstIndex { $0.id == id }
    var out: Element? = nil
    
    if let index {
      var element: Element? = self[index]
      with(&element)
      if let element {
        self[index] = element
      }
      return
    } else {
      with(&out)
      if let out {
        var copy = self
        copy.append(out)
      }
      return
    }
  }
}
