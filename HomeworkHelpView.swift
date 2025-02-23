import SwiftUI

struct HomeworkHelpView: View {
    @StateObject private var viewModel = HomeworkHelpViewModel()
    @State private var question = ""
    @State private var answer = ""
    
    var body: some View {
        VStack {
            TextField("Enter your question", text: $question)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Get Homework Help") {
                viewModel.getHomeworkHelp(question: question) { result in
                    switch result {
                    case .success(let response):
                        answer = response
                    case .failure(let error):
                        print("Failed to get homework help: \(error)")
                    }
                }
            }
            .padding()
            
            if !answer.isEmpty {
                Text("Answer:")
                    .font(.headline)
                    .padding(.top)
                
                Text(answer)
                    .padding()
            }
        }
        .navigationTitle("Homework Help")
    }
}

struct HomeworkHelpView_Previews: PreviewProvider {
    static var previews: some View {
        HomeworkHelpView()
    }
}
