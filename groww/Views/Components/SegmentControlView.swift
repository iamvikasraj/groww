import SwiftUI

struct SegmentControlView: View {
    let tabs: [String]
    @State private var selectedIndex: Int = 0
    
    init(tabs: [String] = ["Explore", "Holdings", "Positions", "Orders", "Wishlist"]) {
        self.tabs = tabs
    }

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
                            .fill(Color.primary)
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
