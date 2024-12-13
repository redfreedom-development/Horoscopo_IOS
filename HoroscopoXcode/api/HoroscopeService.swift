//
//  HoroscopeService.swift
//  HoroscopoXcode
//
//  Created by Tardes on 13/12/24.
//
import Foundation

class HoroscopeService {
    
    // URL base de la API
    private let baseURL = "https://horoscope-app-api.vercel.app/api/v1/get-horoscope/daily"
    
    // Función para obtener el horóscopo
    func fetchHoroscope(for sign: String, on day: String, completion: @escaping (Result<HoroscopeData, Error>) -> Void) {
        
        // Crear la URL con los parámetros
        guard let url = URL(string: "\(baseURL)?sign=\(sign)&day=\(day)") else {
            completion(.failure(HoroscopeError.invalidURL))
            return
        }
        
        // Crear la solicitud
        let request = URLRequest(url: url)
        
        // Iniciar la tarea de URLSession
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Manejar errores de la solicitud
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // Verificar que los datos no sean nulos
            guard let data = data else {
                completion(.failure(HoroscopeError.noData))
                return
            }
            
            do {
                // Intentar decodificar los datos JSON en el modelo
                let horoscopeResponse = try JSONDecoder().decode(HoroscopeResponse.self, from: data)
                
                // Pasar los datos del horóscopo al bloque de completado
                if horoscopeResponse.success {
                    completion(.success(horoscopeResponse.data))
                } else {
                    completion(.failure(HoroscopeError.apiError))
                }
            } catch {
                completion(.failure(error))
            }
        }
        
        // Iniciar la tarea
        task.resume()
    }
}

// Enum para manejar los errores
enum HoroscopeError: Error {
    case invalidURL
    case noData
    case apiError
}
