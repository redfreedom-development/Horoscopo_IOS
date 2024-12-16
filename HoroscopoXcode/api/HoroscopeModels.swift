//
//  HoroscopeModels.swift
//  HoroscopoXcode
//
//  Created by Tardes on 13/12/24.
//

import Foundation

// Estructura para el resultado general de la API
struct HoroscopeResponse: Codable {
    let data: HoroscopeData  // Información de los datos del horóscopo
    let status: Int          // Estado de la respuesta (por ejemplo, 200)
    let success: Bool        // Indica si la solicitud fue exitosa
}

// Estructura para los datos del horóscopo
struct HoroscopeData: Codable {
    let date: String?         // Fecha del horóscopo
    let week: String?         // Fecha del horóscopo
    let month: String?         // Fecha del horóscopo
    let horoscopeData: String // Contenido del horóscopo (el mensaje)

    // Se utiliza para mapear la clave 'horoscope_data' al atributo 'horoscopeData' en Swift
    enum CodingKeys: String, CodingKey {
        case date, week, month
        case horoscopeData = "horoscope_data"
    }
}
