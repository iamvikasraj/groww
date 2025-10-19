import SwiftUI

struct MutualFundsView: View {
    var body: some View {
        ScrollView {
            LazyVStack(pinnedViews: [.sectionHeaders]) {
                // Header without market indices
                HeaderView(title: "Mutual Funds", showMarketIndices: false)
                
                // Sticky Segment Control
                Section(header:
                    SegmentControlView(tabs: ["Explore", "SIP", "Lumpsum", "Holdings", "Orders"])
                        .background(Color.white)
                ) {
                    // Content section
                    VStack {
                        Text("Mutual Funds")
                            .font(.largeTitle)
                            .padding()
                        
                        // Content here
                        ForEach(0..<5) { index in
                            Text("Mutual Funds Item \(index)")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(8)
                                .padding(.horizontal)
                        }
                    }
                }
            }
        }
    }
}