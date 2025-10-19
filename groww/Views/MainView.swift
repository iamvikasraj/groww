import SwiftUI

// MARK: - Custom Tab Item with Dual SVG Icons
struct CustomTabItem: View {
    let activeIconName: String
    let inactiveIconName: String
    let title: String
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 4) {
            Image(isSelected ? activeIconName : inactiveIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
            
            Text(title)
                .font(.system(size: 10, weight: .medium))
                .foregroundColor(isSelected ? Color.primaryBlue : .gray)
        }
    }
}

// Main app structure with native TabView and custom tab items
struct MainView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            StocksView()
                .tabItem {
                    CustomTabItem(
                        activeIconName: "stocks-active",
                        inactiveIconName: "stocks",
                        title: "Stocks",
                        isSelected: selectedTab == 0
                    )
                }
                .tag(0)
            
            FOView()
                .tabItem {
                    CustomTabItem(
                        activeIconName: "fo-active",
                        inactiveIconName: "fo",
                        title: "F&O",
                        isSelected: selectedTab == 1
                    )
                }
                .tag(1)
            
            MutualFundsView()
                .tabItem {
                    CustomTabItem(
                        activeIconName: "funds-active",
                        inactiveIconName: "funds",
                        title: "Mutual Funds",
                        isSelected: selectedTab == 2
                    )
                }
                .tag(2)
            
            UPIView()
                .tabItem {
                    CustomTabItem(
                        activeIconName: "upi-active",
                        inactiveIconName: "upi",
                        title: "UPI",
                        isSelected: selectedTab == 3
                    )
                }
                .tag(3)
            
            LoansView()
                .tabItem {
                    CustomTabItem(
                        activeIconName: "loans-active",
                        inactiveIconName: "loans",
                        title: "Loans",
                        isSelected: selectedTab == 4
                    )
                }
                .tag(4)
        }
        .accentColor(Color.primaryBlue)
    }
}

#Preview {
    MainView()
}
