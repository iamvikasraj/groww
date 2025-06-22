import SwiftUI



extension Color {
    static let primaryBlue = Color(red: 76/255, green: 104/255, blue: 255/255)
    static let primaryGreen = Color(red: 0 / 255, green: 183 / 255, blue: 132 / 255)
    static let softGray = Color(red: 124 / 255, green: 126 / 255, blue: 140 / 255)
}

// Main app structure with tab view
struct MainView: View {
    @State private var selectedTab: Tab = .stocks
    
    enum Tab {
        case stocks
        case fo
        case mutualFunds
        case upi
        case loans
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                // Content based on selected tab
                TabContent(selectedTab: selectedTab)
                
                // Custom animated tab bar
                CustomTabBar(selectedTab: $selectedTab)
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

// Tab content view that changes based on selected tab
struct TabContent: View {
    let selectedTab: MainView.Tab
    
    var body: some View {
        ZStack {
            switch selectedTab {
            case .stocks:
                StocksView()
            case .fo:
                FOView()
            case .mutualFunds:
                MutualFundsView()
            case .upi:
                UPIView()
            case .loans:
                LoansView()
            }
        }
    }
}

// Individual page views with GeometryReader for scroll-based header hiding
struct StocksView: View {
    var body: some View {
        ScrollView {
            LazyVStack(pinnedViews: [.sectionHeaders]) {
                // Header
                VStack {
                    HStack {
                        HStack(spacing: 12) {
                            Image("logo")
                            Text("Stocks")
                                .font(.system(size: 16, weight: .bold))
                        }
                        Spacer()
                        HStack(spacing: 24) {
                            Image("search")
                            Image("qr")
                            Circle()
                                .frame(width: 32, height: 32)
                                .foregroundStyle(.gray.opacity(0.5))
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(.white)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            NiftyCardView(
                                title: "NIFTY 50",
                                label: "25,112.40",
                                highlightedText: "+319.15(1.29%)"
                            )
                            
                            NiftyCardView(
                                title: "SENSEX",
                                label: "79,112.23",
                                highlightedText: "+501.23(0.64%)"
                            )
                            
                            NiftyCardView(
                                title: "BANK NIFTY",
                                label: "42,221.67",
                                highlightedText: "+210.45(0.51%)"
                            )
                        }
                        .padding(.horizontal, 16)
                    }
                }
                
                // Sticky Segment Control
                Section(header:
                    SegmentControlView()
                        .background(Color.white) // Important to block scroll-through
                ) {
                    VStack(alignment:.leading)
                    {
                        Text("Most bought on Groww")
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 18, weight: .semibold))
                        
                        HStack{
                            SquareCardView(
                                title: "RattanIndia Power",
                                label: "$13",
                                highlightedText: "+1.14%(8.94%)"
                            )
                            SquareCardView(
                                title: "RattanIndia Power",
                                label: "$13",
                                highlightedText: "+1.14%(8.94%)"
                            )
                        }
                        
                        HStack{
                            SquareCardView(
                                title: "RattanIndia Power",
                                label: "$13",
                                highlightedText: "+1.14%(8.94%)"
                            )
                            SquareCardView(
                                title: "RattanIndia Power",
                                label: "$13",
                                highlightedText: "+1.14%(8.94%)"
                            )
                        }
                       
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical,16)
                    .padding(.horizontal,16)
                
                }
            }
        }
    }
}

struct SquareCardView: View {
    let title: String
    let label: String
    let highlightedText: String

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            
            VStack(alignment:.leading,spacing:12) {
                
                Rectangle()
                .foregroundStyle(Color.softGray)
                .frame(width: 32, height: 32)
                .cornerRadius(8)
                
                Text(title)
                .font(.system(size: 14, weight: .regular))
                
            }
            
            VStack(alignment:.leading, spacing:10) {
                Text(label)
                    .font(.system(size: 12, weight: .regular))
                Text(highlightedText)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(Color.primaryGreen) // Ensure this color is defined
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 16)
        .padding(.top, 16)
        .padding(.bottom, 12)
        .background(Color.white)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
    }
}


struct FOView: View {
    var body: some View {
        ScrollView {
            LazyVStack(pinnedViews: [.sectionHeaders]) {
                // Header
                VStack {
                    HStack {
                        HStack(spacing: 12) {
                            Image("logo")
                            Text("F&O")
                                .font(.system(size: 16, weight: .bold))
                        }
                        Spacer()
                        HStack(spacing: 24) {
                            Image("search")
                            Image("qr")
                            Circle()
                                .frame(width: 32, height: 32)
                                .foregroundStyle(.gray.opacity(0.5))
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            NiftyCardView(
                                title: "NIFTY 50",
                                label: "25,112.40",
                                highlightedText: "+319.15(1.29%)"
                            )
                            
                            NiftyCardView(
                                title: "SENSEX",
                                label: "79,112.23",
                                highlightedText: "+501.23(0.64%)"
                            )
                        }
                        .padding(.horizontal, 16)
                    }
                }
                
                // Sticky Segment Control
                Section(header:
                    SegmentControlView()
                        .background(Color.white) // Important to block scroll-through
                ) {
                    // Content that scrolls below the segment
                   
                }
            }
        }
    }
}

struct MutualFundsView: View {
    var body: some View {
        GeometryReader { geometry in
//            ScrollView {
//                VStack {
//                    Text("Mutual Funds")
//                        .font(.largeTitle)
//                        .padding()
//                    
//                    // Content here
//                    ForEach(0..<5) { index in
//                        Text("Mutual Funds Item \(index)")
//                            .padding()
//                            .frame(maxWidth: .infinity)
//                            .background(Color.gray.opacity(0.1))
//                            .cornerRadius(8)
//                            .padding(.horizontal)
//                    }
//                }
//            }
        }
    }
}

struct UPIView: View {
    var body: some View {
        GeometryReader { geometry in
//            ScrollView {
//                VStack {
//                    Text("UPI")
//                        .font(.largeTitle)
//                        .padding()
//                    
//                    // Content here
//                    ForEach(0..<5) { index in
//                        Text("UPI Item \(index)")
//                            .padding()
//                            .frame(maxWidth: .infinity)
//                            .background(Color.gray.opacity(0.1))
//                            .cornerRadius(8)
//                            .padding(.horizontal)
//                    }
//                }
//            }
        }
    }
}

struct LoansView: View {
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Text("Loans")
                        .font(.largeTitle)
                        .padding()
                }
            }
        }
    }
}

// Custom tab bar
struct CustomTabBar: View {
    @Binding var selectedTab: MainView.Tab

    var body: some View {
        VStack {
            Rectangle()
                .frame(width: 393, height: 1)
                .foregroundStyle(Color.gray.opacity(0.1))
            HStack {
                // Stocks button
                Button(action: {
                    selectedTab = .stocks
                }) {
                    VStack {
                        Image(selectedTab == .stocks ? "stocks-active" : "stocks")
                            .frame(width: 24, height: 24)
                        Text("Stocks")
                            .font(.system(size: 10, weight: .medium))
                            .foregroundColor(selectedTab == .stocks ? Color.primaryBlue : .gray)
                    }
                    .frame(height: 48, alignment: .center)
                }
                
                Spacer()
                
                // F&O button
                Button(action: {
                    selectedTab = .fo
                }) {
                    VStack {
                        Image(selectedTab == .fo ? "fo-active" : "fo")
                            .frame(width: 24, height: 24)
                        Text("F&O")
                            .font(.system(size: 10, weight: .medium))
                            .foregroundColor(selectedTab == .fo ? Color.primaryBlue : .gray)
                    }
                    .frame(height: 48, alignment: .center)
                }
                
                Spacer()
                
                // Mutual Funds button
                Button(action: {
                    selectedTab = .mutualFunds
                }) {
                    VStack {
                        Image(selectedTab == .mutualFunds ? "funds-active" : "funds")
                            .frame(width: 24, height: 24)
                        Text("Mutual Funds")
                            .font(.system(size: 10, weight: .medium))
                            .foregroundColor(selectedTab == .mutualFunds ? Color.primaryBlue : .gray)
                    }
                    .frame(height: 48, alignment: .center)
                }
                
                Spacer()
                
                // UPI button
                Button(action: {
                    selectedTab = .upi
                }) {
                    VStack(spacing: 4) {
                        Image(selectedTab == .upi ? "upi-active" : "upi")
                            .frame(width: 24, height: 24)
                        Text("UPI")
                            .font(.system(size: 10, weight: .medium))
                            .foregroundColor(selectedTab == .upi ? Color.primaryBlue : .gray)
                    }
                    .frame(height: 48, alignment: .center)
                }
                
                Spacer()
                
                // Loans button
                Button(action: {
                    selectedTab = .loans
                }) {
                    VStack {
                        Image(selectedTab == .loans ? "loans-active" : "loans")
                            .frame(width: 24, height: 24)
                        Text("Loans")
                            .font(.system(size: 10, weight: .medium))
                            .foregroundColor(selectedTab == .loans ? Color.primaryBlue : .gray)
                    }
                    .frame(height: 48, alignment: .center)
                }
            }
            .padding(.top, 0)
            .padding(.horizontal, 40)
            .padding(.bottom, 30)
            .background(Color.white)
        }
    }
}

// Update preview to use the MainView
#Preview {
    MainView()
}

struct NiftyCardView: View {
    let title: String
    let label: String
    let highlightedText: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.system(size: 12, weight: .regular))

            HStack {
                Text(label)
                    .font(.system(size: 12, weight: .regular))
                Text(highlightedText)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(Color.primaryGreen) // Ensure this color is defined
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 16)
        .padding(.bottom, 12)
        .background(Color.white)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
    }
}




struct SegmentControlView: View {
    let tabs = ["Explore", "Holdings", "Positions", "Orders", "Wishlist"]
    @State private var selectedIndex: Int = 0

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            VStack(spacing: 8) {
                HStack(spacing: 26) {
                    ForEach(tabs.indices, id: \.self) { index in
                        Button(action: {
                            withAnimation(.easeInOut) {
                                selectedIndex = index
                            }
                        }) {
                            Text(tabs[index])
                                .foregroundStyle(
                                    selectedIndex == index ? .primary : Color.softGray
                                )
                        }
                    }
                }
                .font(.system(size: 15, weight: .semibold))
                .padding(.horizontal, 14)
                .padding(.vertical, 10)

                // Indicator Bar
                GeometryReader { geo in
                    let tabWidth: CGFloat = geo.size.width / CGFloat(tabs.count)

                    ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(Color.softGray.opacity(0.2))
                            .frame(height: 1)

                        Rectangle()
                            .fill(Color.primary) // Underline color
                            .frame(width: tabWidth - 10, height: 2)
                            .offset(x: tabWidth * CGFloat(selectedIndex) + 5, y: -2)
                            .animation(.easeInOut(duration: 0.25), value: selectedIndex)
                    }
                }
                .frame(height: 4)
            }
        }
    }
}

