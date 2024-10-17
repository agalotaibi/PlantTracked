//
//  SetReminder.swift
//  PlantTracked
//
//  Created by Amaal on 03/04/1446 AH.
//

import SwiftUI

struct SetReminder: View {
    @ObservedObject var viewModel: SetReminderViewModel // Use @ObservedObject to reference passed ViewModel
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack {
            NavigationStack {
                List {
                    Section {
                        HStack {
                            Text("Plant Name")
                            TextField(
                                "Plant Name",
                                text: $viewModel.plantName
                            )
                        }
                    }
                    Section {
                        HStack {
                            Image(systemName: "location")
                            Text("Room")
                            Picker(selection: $viewModel.roomIndex, label: Text("")) {
                                ForEach(viewModel.rooms.indices) { index in
                                    Text(viewModel.rooms[index])
                                }
                            }
                        }
                        HStack {
                            Image(systemName: "sun.max")
                            Text("Light")
                            Picker(selection: $viewModel.lightIndex, label: Text("")) {
                                ForEach(viewModel.lightLevels.indices) { index in
                                    Text(viewModel.lightLevels[index])
                                }
                            }
                        }
                    }
                    Section {
                        HStack {
                            Image(systemName: "drop")
                            Text("Watering Days")
                            Picker(selection: $viewModel.wateringDayIndex, label: Text("")) {
                                ForEach(viewModel.wateringDays.indices) { index in
                                    Text(viewModel.wateringDays[index])
                                }
                            }
                        }
                        HStack {
                            Image(systemName: "drop")
                            Text("Water")
                            Picker(selection: $viewModel.waterIndex, label: Text("")) {
                                ForEach(viewModel.waterAmounts.indices) { index in
                                    Text(viewModel.waterAmounts[index])
                                }
                            }
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Save") {
                            viewModel.saveReminder()
                            dismiss()
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        Text("Set Reminder")
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Cancel") {
                            dismiss()
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    let testViewModel = SetReminderViewModel() // Create a test instance of the view model
        SetReminder(viewModel: testViewModel)
}
