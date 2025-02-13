//
// Copyright © 2025 Roland Lariotte. Under the MIT License.
//

import SwiftUI

/// Populate the To Do list main feature of the application.
struct ToDoListView: View {

  @State private var vm = ToDoListViewModel()

  var body: some View {
    NavigationStack {
      ZStack {
        if vm.allTasks.isEmpty {
          TaskUnavailableView()
        } else {
          List(vm.allTasks, id: \.id) { task in
            ToDoCard(task: task)
          }
        }
      }
      .navigationTitle(L10n.toDoListNavBarTitle)
      .toolbar {
        ToolbarItem(placement: .primaryAction) {
          AddTaskButton(action: { vm.populateAddTaskAlert() })
        }
      }
      .alert(
        L10n.toDoListAlertAddTaskTitle,
        isPresented: $vm.showAddTaskAlert
      ) {
        TaskTextFields(
          task: $vm.task,
          onAdd: { /*Intentionally empty*/ },
          onCancel: { /*Intentionally empty*/ }
        )
      }
    }
  }
}

#Preview {
  ToDoListView()
}
