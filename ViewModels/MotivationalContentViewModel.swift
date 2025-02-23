import Foundation

class MotivationalContentViewModel: ObservableObject {
    @Published var contents: [MotivationalContent] = []
    
    func addContent(title: String, content: String) {
        let newContent = MotivationalContent(id: UUID(), title: title, content: content)
        contents.append(newContent)
    }
}
