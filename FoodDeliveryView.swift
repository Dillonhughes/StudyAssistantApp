import SwiftUI

struct FoodDeliveryView: View {
    @StateObject private var viewModel = FoodDeliveryViewModel()
    @State private var restaurantName = ""
    @State private var menuItem = ""
    @State private var orderTime = Date()
    
    var body: some View {
        VStack {
            TextField("Restaurant Name", text: $restaurantName)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Menu Item", text: $menuItem)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            DatePicker("Order Time", selection: $orderTime)
                .padding()
            
            Button("Add Order") {
                viewModel.addOrder(restaurant: restaurantName, menuItem: menuItem, orderTime: orderTime)
                restaurantName = ""
                menuItem = ""
                orderTime = Date()
            }
            .padding()
            
            List(viewModel.orders) { order in
                HStack {
                    VStack(alignment: .leading) {
                        Text(order.restaurant)
                        Text(order.menuItem)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    Text(order.orderTime, style: .time)
                }
            }
        }
        .navigationTitle("Food Delivery")
    }
}

struct FoodDeliveryView_Previews: PreviewProvider {
    static var previews: some View {
        FoodDeliveryView()
    }
}
