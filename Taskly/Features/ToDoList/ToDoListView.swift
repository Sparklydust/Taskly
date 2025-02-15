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
          List {
            ForEach(vm.allTasks, id: \.id) { task in
              ToDoCard(
                task: task,
                action: { vm.toggleCompletion(on: task) }
              )
            }
            .onDelete { index in
              withAnimation { vm.deleteTask(at: index) }
            }
          }
        }
      }
      .onAppear { vm.getTasksFromDeviceMemory() }
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
          title: $vm.newTaskTitle,
          onAdd: { withAnimation { vm.addTask() }},
          onCancel: { vm.cancelAddingTask() }
        )
      }
    }
  }
}

#Preview {
  ToDoListView()
    .modelContainer(try! TaskData.fakeContainer())
}
