import SwiftUI

// MARK: - Custom Tab Item with Dual SVG Icons
struct CustomTabItem: View {
    let activeIconName: String
    let inactiveIconName: String
    let title: String
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 4) {
            Image(isSelected ? activeIconName : inactiveIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
            
            Text(title)
                .font(.system(size: 10, weight: .medium))
                .foregroundColor(isSelected ? Color.primaryBlue : .gray)
        }
    }
}
