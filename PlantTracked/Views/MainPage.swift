//
//  MainPage.swift
//  PlantTracked
//
//  Created by Amaal on 03/04/1446 AH.
//

import SwiftUI

struct MainPage: View {
    @State private var showingSheet = false
    @StateObject private var viewModel = SetReminderViewModel() // Use StateObject to initialize
    
    
    var body: some View {
        
        //        if reminders.isEmpty {
        //            EmptyState()
        //        }
        //        else if reminders.count == 0 {
        
        
        
        NavigationStack {
            VStack(alignment: .leading){
                Text("Today")
                    .font(.title2)
                    .fontWeight(.bold).frame(width: 200)
                
                List{
                    // Display saved reminders
                    ForEach(viewModel.plantReminder.indices, id: \.self) { index in
                        let reminder = viewModel.plantReminder[index]
                        VStack(alignment: .leading) {
                            HStack(alignment:.center){
                                Image(systemName: reminder.isChecked ? "checkmark.circle.fill" : "circle").resizable()
                                    .frame(width: 30, height: 30).padding().foregroundColor(reminder.isChecked ? .accent : Color(.lightGray))
                                    .onTapGesture {
                                                                            // Toggle the checkmark state
                                                                            viewModel.toggleCheckmark(at: index)
                                                                        }
                                VStack(alignment: .leading, spacing: 10){
                                    HStack{
                                        Image(systemName: "location")
                                        
                                        Text("Room: \(reminder.room)")
                                            .font(.footnote)
                                    }.foregroundStyle(Color(.lightGray))
                                    Text(reminder.name)
                                        .font(.largeTitle)
                                    HStack{
                                        HStack{
                                            Image(systemName: viewModel.lightImage(for: reminder.light))
                                            Text( reminder.light)
                                            
                                        }.foregroundStyle(Color(.sunshin)).frame(minWidth: 10, maxWidth: 180, idealHeight: 30).background(Color(.light)).cornerRadius(10)
                                        HStack{
                                            Image(systemName: "drop")
                                            Text( reminder.water)
                                            
                                        }.foregroundStyle(Color(.watery)).frame(minWidth: 10, maxWidth: 180, idealHeight: 30).background(Color(.light)).cornerRadius(10)
                                            
                                    }
                                }
                            }
                            
                            
                            
                        } .opacity(reminder.isChecked ? 0.5 : 1.0)
                    }.onDelete(perform: deleteReminder) .listRowBackground(Color.clear)
                    
                }.scrollContentBackground(.hidden).frame(width: 470)
            }
            .padding()
            .navigationTitle("My Plants 🌱")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar)  {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("New Reminder")
                    }
                    .foregroundStyle(.accent)
                    .padding()
                    .onTapGesture {
                        showingSheet.toggle()
                    }
                    .sheet(isPresented: $showingSheet) {
                        // Pass the same viewModel to SetReminder
                        SetReminder(viewModel: viewModel)
                    }
                    Spacer()
                }
            }
        }
        
        
        // }
        //        else{
        //            FinishIsEmpty()
        //        }
    }
    // Function to delete reminders
    func deleteReminder(at offsets: IndexSet) {
        viewModel.plantReminder.remove(atOffsets: offsets) // Delete the item
    }
}

#Preview {
    
    MainPage()
}
