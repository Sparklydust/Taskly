//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import XCTest
@testable import Taskly

/// Setup and tear down ``XCUIApplication`` and needed Doubles to be shared with
/// all subclasses tests classes that needed any of them.
///
/// By adding the ``SharedUITestingBase`` as an extension to a test class, we can avoid
/// duplications, setup `app` before running UI Tests and retrieve in one place all shared
/// tests setups, dummies, mocks and spies.
@MainActor class SharedUITestingBase: XCTestCase {

  var app: XCUIApplication!

  override func setUp() async throws {
    continueAfterFailure = false
    app = XCUIApplication()
    app.launchArguments.append("TasklyUITests")
    app.launch()
    try await super.setUp()

  }

  override func tearDown() async throws {
    app.terminate()
    try await super.tearDown()
  }
}
