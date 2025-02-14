//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import SwiftData
import Testing
@testable import Taskly

final class TaskDataTests {

  var sut: TaskData!

  var container: ModelContainer!

  init() throws {
    container = try ModelContainer(
      for: TaskData.self,
      configurations: .init(isStoredInMemoryOnly: true)
    )
    sut = TaskData()
  }

  deinit {
    sut = .none
    container = .none
  }
}
