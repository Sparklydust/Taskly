//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import SwiftData
import SwiftUI

/// Production code entry point to run the Taskly application.
///
/// This struct is used when the system is in production and not under tests.
struct TasklyApp: App {

  var body: some Scene {
    WindowGroup {
      ToDoListView()
        .modelContainer(ModelContainer.shared)
        .onAppear { instantiateColorOnAlerts() }
    }
  }
}

// MARK: - UIView Appearance
extension TasklyApp {

  /// Determine the ``SwiftUI`` color on the alerts' buttons.
  /// - Warning: Fix a ``SwiftUI`` bug on alert. Check future release if issue is fixed.
  private func instantiateColorOnAlerts() {
    UIView.appearance().tintColor = UIColor(named: "AccentColor")
  }
}
