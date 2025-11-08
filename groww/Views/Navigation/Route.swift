import SwiftUI

// MARK: - Navigation Routes
enum Route: Hashable {
    // Stocks routes
    case stockDetail(symbol: String)
    case niftyDetail(index: String)
    
    // F&O routes
    case futuresDetail(symbol: String)
    case optionsDetail(symbol: String)
    
    // Mutual Funds routes
    case fundDetail(fundId: String)
    
    // UPI routes
    case paymentDetail
    case transactionHistory
    
    // Loans routes
    case loanDetail(type: String)
    
    // Generic routes
    case search
    case profile
}
