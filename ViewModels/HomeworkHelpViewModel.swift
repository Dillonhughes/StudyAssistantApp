import Foundation

class HomeworkHelpViewModel: ObservableObject {
    
    func getHomeworkHelp(question: String, completion: @escaping (Result<String, Error>) -> Void) {
        AIService.shared.getHomeworkHelp(question: question, completion: completion)
    }
}
