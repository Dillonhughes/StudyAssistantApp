import SwiftUI

struct MotivationalContentView: View {
    @StateObject private var viewModel = MotivationalContentViewModel()
    @State private var contentTitle = ""
    @State private var contentText = ""
    
    var body: some View {
        VStack {
            TextField("Content Title", text: $contentTitle)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextEditor(text: $contentText)
                .padding()
                .border(Color.gray, width: 1)
            
            Button("Add Content") {
                viewModel.addContent(title: contentTitle, content: contentText)
                contentTitle = ""
                contentText = ""
            }
            .padding()
            
            List(viewModel.contents) { content in
                VStack(alignment: .leading) {
                    Text(content.title)
                        .font(.headline)
                    Text(content.content)
                        .font(.body)
                }
            }
        }
        .navigationTitle("Motivational Content")
    }
}

struct MotivationalContentView_Previews: PreviewProvider {
    static var previews: some View {
        MotivationalContentView()
    }
}
