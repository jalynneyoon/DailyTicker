// Typography.swift
// DesignSystem
// 타이포그래피 스타일 정의

import SwiftUI

public struct DesignSystemFont {
    public static let largeTitle = Font.system(size: 34, weight: .bold)
    public static let title = Font.system(size: 28, weight: .semibold)
    public static let headline = Font.system(size: 17, weight: .semibold)
    public static let body = Font.system(size: 17, weight: .regular)
    public static let callout = Font.system(size: 16, weight: .regular)
    public static let subheadline = Font.system(size: 15, weight: .regular)
    public static let footnote = Font.system(size: 13, weight: .regular)
    public static let caption = Font.system(size: 12, weight: .regular)
}

// UIKit 용 UIFont도 필요하다면 아래 코드 추가
import UIKit

public struct DesignSystemUIFont {
    public static let largeTitle = UIFont.systemFont(ofSize: 34, weight: .bold)
    public static let title = UIFont.systemFont(ofSize: 28, weight: .semibold)
    public static let headline = UIFont.systemFont(ofSize: 17, weight: .semibold)
    public static let body = UIFont.systemFont(ofSize: 17, weight: .regular)
    public static let callout = UIFont.systemFont(ofSize: 16, weight: .regular)
    public static let subheadline = UIFont.systemFont(ofSize: 15, weight: .regular)
    public static let footnote = UIFont.systemFont(ofSize: 13, weight: .regular)
    public static let caption = UIFont.systemFont(ofSize: 12, weight: .regular)
}
