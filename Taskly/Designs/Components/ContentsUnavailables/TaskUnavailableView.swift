//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import SwiftUI

/// A view displayed when there are no tasks available within the to-do list.
struct TaskUnavailableView: View {

  var body: some View {
    ContentUnavailableView(
      L10n.taskUnavailableTitle,
      systemImage: "plus.circle.dashed",
      description: Text(L10n.taskUnavailableDescription)
    )
  }
}

#Preview(traits: .sizeThatFitsLayout) {
  TaskUnavailableView()
}
