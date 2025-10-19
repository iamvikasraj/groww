import SwiftUI

struct StocksView: View {
    var body: some View {
        ScrollView {
            LazyVStack(pinnedViews: [.sectionHeaders]) {
                // Header with market indices
                HeaderView(title: "Stocks")
                
                // Sticky Segment Control
                Section(header:
                    SegmentControlView(tabs: ["Explore", "Holdings", "Positions", "Orders", "Wishlist"])
                        .background(Color.white)
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