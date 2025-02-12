//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import SwiftUI

/// Unit Testing entry point to run the Taskly application.
///
/// This struct is used when triggering the system under tests and not in
/// production, which would bypass the ``TasklyAppTests`` application entry point.
struct TasklyAppTests: App {

  var body: some Scene {
    WindowGroup { EmptyView() }
  }
}
