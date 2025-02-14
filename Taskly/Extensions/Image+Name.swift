//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import SwiftUI

extension Image {

  /// Image representing the add of a new task in the ``ToDoList``.
  static let addTask = Image(systemName: "plus.circle.fill")

  /// Image representing a completed task within a to-do list card.
  static let taskCompleted = Image(systemName: "checkmark.circle.fill")

  /// Image representing an uncompleted task within a to-do list card.
  static let taskUncompleted = Image(systemName: "circle")
}
