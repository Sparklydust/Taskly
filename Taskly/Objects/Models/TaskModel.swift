//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import Foundation

/// Represent a task object in the to-do list.
struct TaskModel: Equatable, Hashable {

  /// A unique identifier for the task.
  let id = UUID()
  /// The task description.
  let description: String
  /// Indicates whether the task is completed.
  var isCompleted = false
  /// The timestamp of when the task was created.
  let createdAt = Date.now
}
