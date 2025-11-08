import SwiftUI

// MARK: - Interactive Navigation Example
// This is a simplified version to help understand the concepts

struct NavigationExampleView: View {
    // Step 1: Create the router (like MainView does)
    @StateObject private var router = NavigationRouter()
    
    var body: some View {
        // Step 2: Wrap in NavigationStack
        NavigationStack(path: $router.path) {
            // Step 3: Root view
            HomeView()
                // Step 4: Tell NavigationStack how to handle routes
                .navigationDestination(for: Route.self) { route in
                    // Step 5: Map route to view
                    destinationView(for: route)
                }
        }
        .environmentObject(router) // Step 6: Share router with children
    }
    
    // Step 7: Route mapping function
    @ViewBuilder
    private func destinationView(for route: Route) -> some View {
        switch route {
        case .stockDetail(let symbol):
            Text("Stock: \(symbol)")
        case .niftyDetail(let index):
            Text("Index: \(index)")
        default:
            Text("Other route")
        }
    }
}

struct HomeView: View {
    // Step 8: Access router from environment
    @EnvironmentObject var router: NavigationRouter
    
    var body: some View {
        VStack {
            Text("Home Screen")
            
            // Step 9: Navigate on button tap
            Button("Go to Stock Detail") {
                // This is what happens when you tap!
                router.navigate(to: .stockDetail(symbol: "AAPL"))
            }
            
            Button("Go to Nifty Detail") {
                router.navigate(to: .niftyDetail(index: "NIFTY 50"))
            }
            
            // Step 10: Show current path state
            Text("Path count: \(router.path.count)")
        }
    }
}

/*
 HOW TO EXPERIMENT:

 1. Add this view to your app temporarily
 2. Add breakpoints in:
    - router.navigate() function
    - destinationView() function
 3. Watch the path change in real-time
 4. Try navigating multiple times and see path grow
 5. Press back button and see path shrink

 WHAT TO OBSERVE:

 - When you tap button → navigate() is called
 - Path count increases → @Published triggers
 - NavigationStack sees change → calls navigationDestination
 - destinationView() is called → returns new view
 - New view appears → with back button

 TRY THESE EXPERIMENTS:

 1. Navigate twice in a row:
    router.navigate(to: .stockDetail(symbol: "AAPL"))
    router.navigate(to: .niftyDetail(index: "NIFTY 50"))
    → Path should have 2 items

 2. Navigate back programmatically:
    router.navigateBack()
    → Path should decrease by 1

 3. Navigate to root:
    router.navigateToRoot()
    → Path should be empty

 4. Add print statements:
    print("Navigating to: \(route)")
    → See console output when navigating
*/
