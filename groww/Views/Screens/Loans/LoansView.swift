import SwiftUI

struct LoansView: View {
    var body: some View {
        ScrollView {
            LazyVStack(pinnedViews: [.sectionHeaders]) {
                // Header without market indices
                HeaderView(title: "Loans", showMarketIndices: false)
                
                // Sticky Segment Control
                Section(header:
                    SegmentControlView(tabs: ["Personal", "Home", "Car", "Education", "Apply"])
                        .background(Color.white)
                ) {
                    // Content section
                    VStack {
                        Text("Loans")
                            .font(.largeTitle)
                            .padding()
                    }
                }
            }
        }
    }
}