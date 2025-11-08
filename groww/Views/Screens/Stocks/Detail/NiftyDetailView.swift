import SwiftUI

struct NiftyDetailView: View {
    let index: String
    @EnvironmentObject var router: NavigationRouter
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Header
                VStack(alignment: .leading, spacing: 8) {
                    Text(index)
                        .font(.system(size: 28, weight: .bold))
                    Text("Index Details")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                }
                .padding()
                
                // Price Card
                VStack(alignment: .leading, spacing: 12) {
                    Text("Current Value")
                        .font(.system(size: 14))
                        .foregroundColor(.gray)
                    Text("25,112.40")
                        .font(.system(size: 36, weight: .bold))
                    HStack {
                        Text("+319.15 (1.29%)")
                            .font(.system(size: 18))
                            .foregroundColor(Color.primaryGreen)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.white)
                .cornerRadius(12)
                .padding(.horizontal)
                
                // Components Section
                VStack(alignment: .leading, spacing: 16) {
                    Text("Top Components")
                        .font(.system(size: 18, weight: .semibold))
                        .padding(.horizontal)
                    
                    ForEach(["RELIANCE", "TCS", "HDFC Bank", "ICICI Bank", "Infosys"], id: \.self) { stock in
                        HStack {
                            Text(stock)
                                .font(.system(size: 14))
                            Spacer()
                            Text("5.2%")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.gray)
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color.white)
                    }
                }
                .padding(.vertical)
            }
        }
        .navigationTitle(index)
        .navigationBarTitleDisplayMode(.inline)
        .background(Color.gray.opacity(0.1))
    }
}
