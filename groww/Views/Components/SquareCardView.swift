import SwiftUI

struct SquareCardView: View {
    let title: String
    let label: String
    let highlightedText: String

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            
            VStack(alignment:.leading,spacing:12) {
                
                Rectangle()
                .foregroundStyle(Color.softGray)
                .frame(width: 32, height: 32)
                .cornerRadius(8)
                
                Text(title)
                .font(.system(size: 14, weight: .regular))
                
            }
            
            VStack(alignment:.leading, spacing:10) {
                Text(label)
                    .font(.system(size: 12, weight: .regular))
                Text(highlightedText)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(Color.primaryGreen)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 16)
        .padding(.top, 16)
        .padding(.bottom, 12)
        .background(Color.white)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
    }
}
