//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import SwiftData

extension ModelContainer {

  /// A shared instance of ``ModelContainer`` that is used to manage the app's SwiftData objects.
  /// - Warning: Must be initialized within a `.modelContainer(_:)` in the ``TasklyApp`` file.
  static let shared: ModelContainer = {
    do {
      return try ModelContainer(for: TaskData.self)
    } catch {
      fatalError("Failed to create `ModelContainer` for the objects: \(error)")
    }
  }()
}
