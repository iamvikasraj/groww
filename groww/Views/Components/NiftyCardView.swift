import SwiftUI

struct NiftyCardView: View {
    let title: String
    let label: String
    let highlightedText: String
    var onTap: (() -> Void)? = nil

    var body: some View {
        Button(action: {
            onTap?()
        }) {
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.system(size: 12, weight: .regular))

                HStack {
                    Text(label)
                        .font(.system(size: 12, weight: .regular))
                    Text(highlightedText)
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(Color.primaryGreen)
                }
            }
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
        .buttonStyle(PlainButtonStyle())
    }
}
