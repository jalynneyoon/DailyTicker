// PrimaryButton.swift
// DesignSystem
// SwiftUI용 Primary 버튼 컴포넌트 예시

import SwiftUI

public struct PrimaryButton: View {
    public let title: String
    public var action: () -> Void
    
    public init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            Text(title)
                .font(DesignSystemFont.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, Spacing.md.rawValue)
                .background(Color.primary)
                .cornerRadius(12)
        }
    }
}

#if DEBUG
#Preview {
    PrimaryButton(title: "Primary") {}
        .padding()
        .background(Color.background)
}
#endif
