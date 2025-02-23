import Foundation

class BreakWellnessViewModel: ObservableObject {
    @Published var reminders: [BreakReminder] = []
    
    func addReminder(title: String, time: Date) {
        let newReminder = BreakReminder(id: UUID(), title: title, time: time)
        reminders.append(newReminder)
    }
}
