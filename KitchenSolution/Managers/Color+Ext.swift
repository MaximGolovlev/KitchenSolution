//
//  COlor+Ext.swift
//  KitchenSolution
//
//  Created by Maxim Golovlev on 31.08.2025.
//

import SwiftUICore

extension Color {
    // Основная цветовая палитра
    static let primaryColor = Color(hex: "4CAF50") // Зеленый - основной брендовый цвет
    static let accentColor = Color(hex: "FF6B35")  // Оранжевый - акцентный цвет
    static let secondaryColor = Color(hex: "6A89CC") // Синий - вторичный цвет
    
    // Фоны
    static let background = Color(.systemBackground)     // Светлый серый фон
    static let cardBackground = Color(.secondarySystemBackground)  // Белый фон для карточек
    static let sheetBackground = Color(hex: "F1F3F5") // Фон для модальных окон
    
    // Текст
    static let textPrimary = Color(.label)    // Основной текст (почти черный)
    static let textSecondary = Color(.secondaryLabel)  // Вторичный текст (серый)
    static let textOnPrimary = Color(hex: "FFFFFF")  // Текст на основном цвете
    static let textOnAccent = Color(hex: "FFFFFF")   // Текст на акцентном цвете
    
    // Состояния
    static let success = Color(hex: "28A745")        // Успех (зеленый)
    static let warning = Color(hex: "FFC107")        // Предупреждение (желтый)
    static let error = Color(hex: "DC3545")          // Ошибка (красный)
    static let info = Color(hex: "17A2B8")           // Информация (голубой)
    
    // Градиенты
    static let gradientStart = Color(hex: "4CAF50")  // Начало градиента
    static let gradientEnd = Color(hex: "45A049")    // Конец градиента
    
    // Дополнительные цвета для ингредиентов
    static let vegetableColor = Color(hex: "8BC34A")  // Цвет для овощей
    static let proteinColor = Color(hex: "FF9800")    // Цвет для белков
    static let dairyColor = Color(hex: "FFEB3B")      // Цвет для молочных продуктов
    static let grainColor = Color(hex: "795548")      // Цвет для зерновых
    static let spiceColor = Color(hex: "F44336")      // Цвет для специй
    static let fruitColor = Color(hex: "E91E63")      // Цвет для фруктов
    
    // Инициализатор из HEX строки
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
