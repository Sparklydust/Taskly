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
  // intentionally empty
}
