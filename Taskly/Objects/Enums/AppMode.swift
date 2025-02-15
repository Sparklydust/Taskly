//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import Foundation

/// Main configuration for the PumpKit app when the need to change the application state is required
/// during `MarketingScreenshots` flow.
enum AppMode {

  /// Argument for the process info for when the app starts as a ``XCUIApplication``
  /// to make run UI Tests.
  ///
  /// Used to bypass production code when running UI Tests.
  static let tasklyUITests = ProcessInfo().arguments.contains("TasklyUITests")
}
