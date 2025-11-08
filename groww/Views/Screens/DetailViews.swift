import SwiftUI

// MARK: - Placeholder Detail Views

struct FuturesDetailView: View {
    let symbol: String
    var body: some View {
        Text("Futures Detail: \(symbol)")
            .navigationTitle("Futures")
    }
}

struct OptionsDetailView: View {
    let symbol: String
    var body: some View {
        Text("Options Detail: \(symbol)")
            .navigationTitle("Options")
    }
}

struct FundDetailView: View {
    let fundId: String
    var body: some View {
        Text("Fund Detail: \(fundId)")
            .navigationTitle("Mutual Fund")
    }
}

struct PaymentDetailView: View {
    var body: some View {
        Text("Payment Detail")
            .navigationTitle("Payment")
    }
}

struct TransactionHistoryView: View {
    var body: some View {
        Text("Transaction History")
            .navigationTitle("History")
    }
}

struct LoanDetailView: View {
    let type: String
    var body: some View {
        Text("Loan Detail: \(type)")
            .navigationTitle("Loan")
    }
}

struct SearchView: View {
    var body: some View {
        Text("Search")
            .navigationTitle("Search")
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile")
            .navigationTitle("Profile")
    }
}
