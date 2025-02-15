//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import Foundation
import Testing
@testable import Taskly

struct AppModeTests {

  @Test func testConstant_marketingScreenshots_isEqualToProcessInfoArgumentTasklyUITests() {
    let expected = ProcessInfo().arguments.contains("TasklyUITests")

    let result = AppMode.tasklyUITests

    #expect(result == expected, "`tasklyUITests` must be equal to `\(expected)`.")
  }
}
