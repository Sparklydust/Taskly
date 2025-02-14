//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import Foundation

import SwiftData

// Setup fake data for unit tests when initializing ``TaskData``.

extension TaskData {

  /// Create fake ``TaskData`` object for unit tests.
  /// - Returns: Initialized object with fake data.
  static func fake() -> TaskData {
    .init()
  }
}

// MARK: - Previews
extension TaskData {

  /// Creates a fake ``ModelContainer`` with a ``TaskData`` inserted, for previews.
  /// - Returns: A ``ModelContainer`` configured for in-memory use with the fake inserted data.
  /// - Throws: An error if the ``ModelContainer`` cannot be created.
  @MainActor static func fakeContainer(
    data: [TaskData] = [.fake()]
  ) throws -> ModelContainer {
    do {
      let container = try ModelContainer(
        for: TaskData.self,
        configurations: .init(isStoredInMemoryOnly: true)
      )
      data.forEach { container.mainContext.insert($0) }

      return container
    } catch {
      fatalError("A fake `TaskData` must be created within the preview.")
    }
  }
}

// MARK: - Unit Tests
extension TaskData {

  /// A static property to hold a fake ``ModelContext`` for internal use during unit testing.
  ///
  /// This property should not be accessed directly in tests. Instead, use `modelContext` which will
  /// return this context when it's set up during tests.
  @MainActor static var internalFakeContext: ModelContext?

  /// Sets up a fake ``ModelContext`` for unit testing.
  ///
  /// This method creates an in-memory ``ModelContext`` and assigns it to `modelContextFake`.
  /// It allows for an optional closure to insert data into the context, which is useful for
  /// preparing test scenarios with pre-existing data.
  /// ## Example Usage:
  /// ```swift
  /// // Setup the fake context with data for tests
  /// let fakeContext = TaskData.fakeContext { context in
  ///   let data = TaskData.fake()
  ///   context.insert(data)
  /// }
  /// ```
  /// - Parameter insertData: A closure that takes a ``ModelContext`` and allows you to insert
  ///   data into the fake context. By default, this closure does nothing.
  /// - Returns: The fake ``ModelContext`` that has been set up.
  /// - Note: This method must be called on the main thread, as indicated by the `@MainActor` attribute.
  @MainActor static func fakeContext(
    data: (ModelContext) -> Void = { _ in }
  ) -> ModelContext {
    do {
      let fakeContext = try ModelContainer(
        for: TaskData.self,
        configurations: .init(isStoredInMemoryOnly: true)
      ).mainContext
      TaskData.internalFakeContext = fakeContext

      data(fakeContext)
      return fakeContext
    } catch {
      fatalError("Failed to create `ModelContext` for `TaskData`: \(error)")
    }
  }
}
