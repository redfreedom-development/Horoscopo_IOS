//
//  HoroscopeService.swift
//  HoroscopoXcode
//
//  Created by Tardes on 13/12/24.
//
import Foundation

class HoroscopeService {
    
    
    // Función para obtener el horóscopo
    func fetchHoroscope(for sign: String, timeFrame: String, completion: @escaping (Result<HoroscopeData, Error>) -> Void) {
        
        // Crear la URL base
        var baseURL = URL(string: "https://horoscope-app-api.vercel.app/api/v1/get-horoscope")!
        
        // Añadir la parte dinámica del path (timeFrame)
        baseURL.appendPathComponent(timeFrame) // Ejemplo: "monthly" o "daily"
        
        // Usar URLComponents para añadir parámetros de consulta
        var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false)!
        components.queryItems = [
            URLQueryItem(name: "sign", value: sign) // Ejemplo: sign=Aries
        ]
        
        // Construir la URL final
        guard let finalURL = components.url else {
            completion(.failure(HoroscopeError.invalidURL))
           
            return
        }
        print("\(finalURL)")
        
        // Crear la solicitud
        let request = URLRequest(url: finalURL)
        
        // Hacer la solicitud
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            // Manejar errores de la red
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // Validar el código de estado HTTP
            if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
                completion(.failure(HoroscopeError.apiError))
                return
            }
            
            // Validar los datos recibidos
            guard let data = data else {
                completion(.failure(HoroscopeError.noData))
                return
            }
            // Imprimir la respuesta completa de la API para ver qué se está recibiendo
               if let responseString = String(data: data, encoding: .utf8) {
                   print("Respuesta de la API: \(responseString)")  // Esto te permitirá ver el contenido de la respuesta
               }

            
            // Decodificar el JSON
            do {
                let horoscopeResponse = try JSONDecoder().decode(HoroscopeResponse.self, from: data)
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
