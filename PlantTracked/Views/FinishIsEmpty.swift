//
//  FinishIsEmpty.swift
//  PlantTracked
//
//  Created by Amaal on 11/04/1446 AH.
//

import SwiftUI

struct FinishIsEmpty: View {
    @State private var showingSheet = false
    @StateObject private var viewModel = SetReminderViewModel() // Use StateObject to initialize


    var body: some View {
        
        NavigationStack {
            VStack(alignment: .center, spacing:40){
                Image("Done")
                Text("All Done! 🎉")
                    .font(.title)
                Text("All Reminders Completed")
                    .font(.footnote).frame(width: 300).foregroundStyle(.gray)
                
                
                
            }.padding().navigationTitle("My Plants 🌱")
                .toolbar {
                ToolbarItemGroup(placement: .bottomBar)  {
                    
                    
                        HStack{
                            Image(systemName: "plus.circle.fill")
                            Text("New Reminder")
                            
                        }.foregroundStyle(.accent).padding().onTapGesture {
                            showingSheet.toggle()
                        }.sheet(isPresented: $showingSheet) {
                            SetReminder(viewModel: viewModel)
                        }
                        Spacer()
                        
                    
                }
            }
        }
    }
}

#Preview {
    FinishIsEmpty()
}
