import SwiftUI

// Main app structure with native TabView and custom tab items
struct MainView: View {
    @StateObject private var router = NavigationRouter()
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStack(path: $router.path) {
                StocksView()
                    .navigationDestination(for: Route.self) { route in
                        routeView(for: route)
                    }
            }
            .tabItem {
                CustomTabItem(
                    activeIconName: "stocks-active",
                    inactiveIconName: "stocks",
                    title: "Stocks",
                    isSelected: selectedTab == 0
                )
            }
            .tag(0)
            .environmentObject(router)
            
            NavigationStack(path: $router.path) {
                FOView()
                    .navigationDestination(for: Route.self) { route in
                        routeView(for: route)
                    }
            }
            .tabItem {
                CustomTabItem(
                    activeIconName: "fo-active",
                    inactiveIconName: "fo",
                    title: "F&O",
                    isSelected: selectedTab == 1
                )
            }
            .tag(1)
            .environmentObject(router)
            
            NavigationStack(path: $router.path) {
                MutualFundsView()
                    .navigationDestination(for: Route.self) { route in
                        routeView(for: route)
                    }
            }
            .tabItem {
                CustomTabItem(
                    activeIconName: "funds-active",
                    inactiveIconName: "funds",
                    title: "Mutual Funds",
                    isSelected: selectedTab == 2
                )
            }
            .tag(2)
            .environmentObject(router)
            
            NavigationStack(path: $router.path) {
                UPIView()
                    .navigationDestination(for: Route.self) { route in
                        routeView(for: route)
                    }
            }
            .tabItem {
                CustomTabItem(
                    activeIconName: "upi-active",
                    inactiveIconName: "upi",
                    title: "UPI",
                    isSelected: selectedTab == 3
                )
            }
            .tag(3)
            .environmentObject(router)
            
            NavigationStack(path: $router.path) {
                LoansView()
                    .navigationDestination(for: Route.self) { route in
                        routeView(for: route)
                    }
            }
            .tabItem {
                CustomTabItem(
                    activeIconName: "loans-active",
                    inactiveIconName: "loans",
                    title: "Loans",
                    isSelected: selectedTab == 4
                )
            }
            .tag(4)
            .environmentObject(router)
        }
        .accentColor(Color.primaryBlue)
    }
    
    @ViewBuilder
    private func routeView(for route: Route) -> some View {
        switch route {
        case .stockDetail(let symbol):
            StockDetailView(symbol: symbol)
        case .niftyDetail(let index):
            NiftyDetailView(index: index)
        case .futuresDetail(let symbol):
            FuturesDetailView(symbol: symbol)
        case .optionsDetail(let symbol):
            OptionsDetailView(symbol: symbol)
        case .fundDetail(let fundId):
            FundDetailView(fundId: fundId)
        case .paymentDetail:
            PaymentDetailView()
        case .transactionHistory:
            TransactionHistoryView()
        case .loanDetail(let type):
            LoanDetailView(type: type)
        case .search:
            SearchView()
        case .profile:
            ProfileView()
        }
    }
}

#Preview {
    MainView()
}
