import Foundation

class FoodDeliveryViewModel: ObservableObject {
    @Published var orders: [FoodOrder] = []
    
    func addOrder(restaurant: String, menuItem: String, orderTime: Date) {
        let newOrder = FoodOrder(id: UUID(), restaurant: restaurant, menuItem: menuItem, orderTime: orderTime)
        orders.append(newOrder)
    }
}
