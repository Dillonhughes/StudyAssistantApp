import SwiftUI

struct BreakWellnessView: View {
    @StateObject private var viewModel = BreakWellnessViewModel()
    @State private var reminderTitle = ""
    @State private var reminderTime = Date()
    
    var body: some View {
        VStack {
            TextField("Reminder Title", text: $reminderTitle)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            DatePicker("Reminder Time", selection: $reminderTime)
                .padding()
            
            Button("Add Reminder") {
                viewModel.addReminder(title: reminderTitle, time: reminderTime)
                reminderTitle = ""
                reminderTime = Date()
            }
            .padding()
            
            List(viewModel.reminders) { reminder in
                HStack {
                    Text(reminder.title)
                    Spacer()
                    Text(reminder.time, style: .time)
                }
            }
        }
        .navigationTitle("Break & Wellness")
    }
}

struct BreakWellnessView_Previews: PreviewProvider {
    static var previews: some View {
        BreakWellnessView()
    }
}
