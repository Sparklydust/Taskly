//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import Foundation

// Setup fake data for unit tests when initializing ``TaskModel``.

extension TaskModel {

  /// Create fake ``TaskModel`` object for unit tests.
  /// - Returns: Initialized object with fake data.
  static func fake(
    id: UUID = UUID(),
    title: String = "Buy some milk",
    isCompleted: Bool = false,
    createdAt: Date = .now
  ) -> TaskModel {
    .init(
      id: id,
      title: title,
      isCompleted: isCompleted,
      createdAt: createdAt
    )
  }

  /// Create fake ``TaskModel`` object for unit tests.
  /// - Returns: Initialized object with fake data.
  static func fake(
    with data: TaskData
  ) -> TaskModel {
    .init(
      with: data
    )
  }
}

// MARK: - Fake Initializer
private extension TaskModel {

  /// Initialized all available values from ``TaskModel``.
  /// - Warning: Initializer to be used for ``TaskModel.fake()`` only.
  init(
    id: UUID,
    title: String,
    isCompleted: Bool,
    createdAt: Date
  ) {
    self.id = id
    self.title = title
    self.isCompleted = isCompleted
    self.createdAt = createdAt
  }
}
