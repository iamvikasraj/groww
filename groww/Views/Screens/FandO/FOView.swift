import SwiftUI

struct FOView: View {
    var body: some View {
        ScrollView {
            LazyVStack(pinnedViews: [.sectionHeaders]) {
                // Header with market indices
                HeaderView(title: "F&O")
                
                // Sticky Segment Control
                Section(header:
                    SegmentControlView(tabs: ["Futures", "Options", "Strategies", "Positions", "Orders"])
                        .background(Color.white)
                ) {
                    // Content that scrolls below the segment
                   
                }
            }
        }
    }
}