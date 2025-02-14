//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import Testing
@testable import Taskly

/// Setup and tear down Doubles to be shared with all subclasses tests classes that needed any of them.
///
/// By adding the ``SharedTestingBase`` as an extension to a test class, we can avoid duplications
/// and retrieve in one place all shared tests setups, dummies, mocks and spies.
class SharedTestingBase: @unchecked Sendable {

  init() async {
    await setupData()
  }

  deinit {
    tearDownData()
  }
}

// MARK: - Data
extension SharedTestingBase {

  /// Setup SwiftData object for unit tests to use inMemory storage only.
  @MainActor private func setupData() {
    TaskData.internalFakeContext = TaskData.fakeContext()
  }

  /// Remove SwiftData object from inMemory to clean tests.
  private func tearDownData() {
    Task { @MainActor in
      TaskData.internalFakeContext = .none
    }
  }
}
