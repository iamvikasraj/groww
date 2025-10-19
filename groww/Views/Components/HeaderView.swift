import SwiftUI

struct HeaderView: View {
    let title: String
    let showMarketIndices: Bool
    let marketIndices: [MarketIndex]
    
    init(title: String, showMarketIndices: Bool = true, marketIndices: [MarketIndex] = []) {
        self.title = title
        self.showMarketIndices = showMarketIndices
        self.marketIndices = marketIndices.isEmpty ? HeaderView.defaultMarketIndices : marketIndices
    }
    
    static let defaultMarketIndices = [
        MarketIndex(title: "NIFTY 50", value: "25,112.40", change: "+319.15(1.29%)"),
        MarketIndex(title: "SENSEX", value: "79,112.23", change: "+501.23(0.64%)"),
        MarketIndex(title: "BANK NIFTY", value: "42,221.67", change: "+210.45(0.51%)")
    ]
    
    var body: some View {
        VStack {
            // Top Header Bar
            HStack {
                HStack(spacing: 12) {
                    Image("logo")
                    Text(title)
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
            
            // Market Indices Section (only if enabled)
            if showMarketIndices {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(marketIndices, id: \.title) { index in
                            NiftyCardView(
                                title: index.title,
                                label: index.value,
                                highlightedText: index.change
                            )
                        }
                    }
                    .padding(.horizontal, 16)
                }
            }
        }
    }
}

struct MarketIndex {
    let title: String
    let value: String
    let change: String
}
