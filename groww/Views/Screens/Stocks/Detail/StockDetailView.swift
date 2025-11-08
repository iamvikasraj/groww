import SwiftUI

struct StockDetailView: View {
    let symbol: String
    @EnvironmentObject var router: NavigationRouter
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header
                HStack {
                    VStack(alignment: .leading) {
                        Text(symbol)
                            .font(.system(size: 24, weight: .bold))
                        Text("Stock Details")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding()
                
                // Price Card
                VStack(alignment: .leading, spacing: 12) {
                    Text("Current Price")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    Text("₹1,234.56")
                        .font(.system(size: 32, weight: .bold))
                    HStack {
                        Text("+12.34 (1.02%)")
                            .font(.system(size: 16))
                            .foregroundColor(Color.primaryGreen)
                        Text("Today")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.white)
                .cornerRadius(12)
                .padding(.horizontal)
                
                // Details Section
                VStack(alignment: .leading, spacing: 16) {
                    Text("Details")
                        .font(.system(size: 18, weight: .semibold))
                        .padding(.horizontal)
                    
                    DetailRow(title: "Market Cap", value: "₹50,000 Cr")
                    DetailRow(title: "Volume", value: "1.2M")
                    DetailRow(title: "52W High", value: "₹1,500")
                    DetailRow(title: "52W Low", value: "₹800")
                }
                .padding(.vertical)
            }
        }
        .navigationTitle(symbol)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.gray.opacity(0.1))
    }
}

struct DetailRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 14))
                .foregroundColor(.gray)
            Spacer()
            Text(value)
                .font(.system(size: 14, weight: .medium))
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color.white)
    }
}
