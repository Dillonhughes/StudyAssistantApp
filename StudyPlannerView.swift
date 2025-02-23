import SwiftUI

struct StudyPlannerView: View {
    @StateObject private var viewModel = StudyPlannerViewModel()
    @State private var taskTitle = ""
    @State private var taskDeadline = Date()
    @State private var taskEstimatedTime = TimeInterval(60 * 60)
    
    var body: some View {
        VStack {
            TextField("Task Title", text: $taskTitle)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            DatePicker("Deadline", selection: $taskDeadline)
                .padding()
            
            Stepper("Estimated Time (hours): \(Int(taskEstimatedTime / 3600))", value: $taskEstimatedTime, in: 3600...86400, step: 3600)
                .padding()
            
            Button("Add Task") {
                viewModel.addTask(title: taskTitle, deadline: taskDeadline, estimatedTime: taskEstimatedTime)
                taskTitle = ""
                taskDeadline = Date()
                taskEstimatedTime = 3600
            }
            .padding()
            
            Button("Get Smart Schedule") {
                viewModel.getSmartSchedule()
            }
            .padding()
            
            Button("Get Study Recommendations") {
                viewModel.getStudyRecommendations()
            }
            .padding()
            
            List(viewModel.tasks) { task in
                HStack {
                    Text(task.title)
                    Spacer()
                    Text(task.deadline, style: .date)
                    if task.completed {
                        Image(systemName: "checkmark")
                    }
                }
            }
            
            List(viewModel.recommendations, id: \.self) { recommendation in
                Text(recommendation)
            }
        }
        .navigationTitle("Study Planner")
    }
}

struct StudyPlannerView_Previews: PreviewProvider {
    static var previews: some View {
        StudyPlannerView()
    }
}
