//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import Foundation

// Setup fake data for unit tests when initializing ``TaskModel``.

extension TaskModel {

  /// Create fake ``TaskModel`` object for unit tests.
  /// - Returns: Initialized object with fake data.
  static func fake(
    description: String = "Buy some milk",
    isCompleted: Bool = false
  ) -> TaskModel {
    .init(
      description: description,
      isCompleted: isCompleted
    )
  }
}
