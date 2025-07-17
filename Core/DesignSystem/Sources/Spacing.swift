// Spacing.swift
// DesignSystem
// 디자인 시스템 Spacing(간격) 값 정의

import Foundation

public enum Spacing: CGFloat {
    case xs = 4
    case sm = 8
    case md = 16
    case lg = 24
    case xl = 32
    case xxl = 40
    // 필요에 따라 추가/수정
}

// 사용 예시: VStack(spacing: Spacing.md.rawValue) { ... }
