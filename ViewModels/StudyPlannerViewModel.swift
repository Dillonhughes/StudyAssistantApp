import Foundation

class StudyPlannerViewModel: ObservableObject {
    @Published var tasks: [StudyTask] = []
    @Published var recommendations: [String] = []
    
    func addTask(title: String, deadline: Date, estimatedTime: TimeInterval) {
        let newTask = StudyTask(id: UUID(), title: title, deadline: deadline, estimatedTime: estimatedTime, completed: false)
        tasks.append(newTask)
    }
    
    func completeTask(id: UUID) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks[index].completed = true
        }
    }
    
    func getSmartSchedule() {
        AIService.shared.getSmartSchedule(tasks: tasks) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let updatedTasks):
                    self.tasks = updatedTasks
                case .failure(let error):
                    print("Failed to get smart schedule: \(error)")
                }
            }
        }
    }
    
    func getStudyRecommendations() {
        AIService.shared.getStudyRecommendations { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let recommendations):
                    self.recommendations = recommendations
                case .failure(let error):
                    print("Failed to get study recommendations: \(error)")
                }
            }
        }
    }
}

