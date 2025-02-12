//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import SwiftUI
import Testing
@testable import Taskly

struct Image_NameTests {

  @Test func imageName_addTask_isEqualToSystemNamePlusCircleFill() {
    let expected = Image(systemName: "plus.circle.fill")

    let result = Image.addTask

    #expect(result == expected, "Image `addTask` should be equal to `plus.circle.fill` system image.")
  }
}
