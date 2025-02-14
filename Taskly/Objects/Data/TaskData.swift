//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import Foundation
import SwiftData

/// Task data from the user created tasks to be saved in persistent store.
@Model final class TaskData {

  init() {
    // Intentionally empty
  }
}

// MARK: - Model Context
extension TaskData {

  /// Provides the shared context for the ``TaskData`` model.
  ///
  /// This static property creates a ``ModelContainer`` for the ``TaskData`` type and
  /// retrieves its `mainContext`. The context is used for managing and interacting with instances of
  /// ``TaskData``.
  /// - Note: This property is isolated to the main actor, ensuring that all interactions with the
  /// `mainContext` occur on the main thread, maintaining thread safety.
  /// - Warning: `internalFakeContext` is for Unit Tests only. Do not use in production code.
  @MainActor static var modelContext: ModelContext {
    guard internalFakeContext == .none else { return internalFakeContext! }
    return ModelContainer.shared.mainContext
  }
}
