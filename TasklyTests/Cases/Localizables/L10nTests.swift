//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import Testing
@testable import Taskly

struct L10nTests {

  @Test func translationForKey_toDoListNavBarTitle_returnsAssociatedTranslation() {
    let expected = "To Do"

    let result = L10n.toDoListNavBarTitle

    #expect(result == expected, "Translation must match the one in the associated `L10n` Table file.")
  }
}
