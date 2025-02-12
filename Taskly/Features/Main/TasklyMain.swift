//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import Foundation

/// Main entry point at the Taskly application startup.
///
/// ``TasklyMain`` check if the application is running tests to bypass the normal ``TasklyApp``
/// and run the ``TasklyAppTests`` instead to take control of the application launch and
/// avoid running instances during unit tests when initialized.
@main
struct TasklyMain {

  static func main() throws {
    guard NSClassFromString("XCTestCase") == .none else {
      TasklyAppTests.main()
      return
    }
    TasklyApp.main()
  }
}
