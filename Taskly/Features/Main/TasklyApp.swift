//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import SwiftUI

/// Production code entry point to run the Taskly application.
///
/// This struct is used when the system is in production and not under tests.
struct TasklyApp: App {

  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
