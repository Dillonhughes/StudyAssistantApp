import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: StudyPlannerView()) {
                    Text("Study Planner")
                }
                .padding()
                
                NavigationLink(destination: BreakWellnessView()) {
                    Text("Break & Wellness Reminders")
                }
                .padding()
                
                NavigationLink(destination: FoodDeliveryView()) {
                    Text("Food Delivery")
                }
                .padding()
                
                NavigationLink(destination: MotivationalContentView()) {
                    Text("Motivational Content & Insights")
                }
                .padding()
                
                NavigationLink(destination: HomeworkHelpView()) {
                    Text("Homework Help")
                }
                .padding()
            }
            .navigationTitle("Smart Study Assistant")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
