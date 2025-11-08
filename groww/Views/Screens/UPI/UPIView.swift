import SwiftUI

struct UPIView: View {
    var body: some View {
        ScrollView {
            LazyVStack(pinnedViews: [.sectionHeaders]) {
                // Header without market indices
                HeaderView(title: "UPI", showMarketIndices: false)
                
                // Sticky Segment Control
                Section(header:
                    SegmentControlView(tabs: ["Pay", "Request", "History", "Contacts", "Settings"])
                        .background(Color.white)
                ) {
                    // Content section
                    VStack {
                        Text("UPI")
                            .font(.largeTitle)
                            .padding()
                        
                        // Content here
                        ForEach(0..<5) { index in
                            Text("UPI Item \(index)")
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