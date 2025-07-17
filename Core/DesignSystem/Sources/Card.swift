// Card.swift
// DesignSystem
// SwiftUI Card 컴포넌트(콘텐츠 박스)

import SwiftUI

public struct Card<Content: View>: View {
    public let content: Content
    public var cornerRadius: CGFloat
    public var backgroundColor: Color
    public var shadowRadius: CGFloat

    public init(
        cornerRadius: CGFloat = 16,
        backgroundColor: Color = .background,
        shadowRadius: CGFloat = 6,
        @ViewBuilder content: () -> Content
    ) {
        self.content = content()
        self.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
        self.shadowRadius = shadowRadius
    }

    public var body: some View {
        content
            .padding(Spacing.lg.rawValue)
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
            .shadow(radius: shadowRadius)
    }
}

#if DEBUG
#Preview {
    Card {
        VStack(alignment: .leading, spacing: Spacing.md.rawValue) {
            Text("Card Title").font(DesignSystemFont.title)
            Text("This is card content.").font(DesignSystemFont.body)
        }
    }
    .padding()
    .background(Color(.systemGroupedBackground))
}
#endif
