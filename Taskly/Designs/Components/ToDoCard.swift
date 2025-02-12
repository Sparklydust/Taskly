//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import SwiftUI

/// Card populated on the ``ToDoListView`` to showcase user's saved task.
struct ToDoCard: View {

  /// The task to populate on the card.
  let task: String

  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text(task)
        .font(.body)
        .foregroundStyle(.primary)
    }
    .padding(.horizontal, 4)
    .padding(.vertical, 8)
  }
}

#Preview(traits: .sizeThatFitsLayout) {
  ToDoCard(task: "Get a new book at the bookstore.")
}
