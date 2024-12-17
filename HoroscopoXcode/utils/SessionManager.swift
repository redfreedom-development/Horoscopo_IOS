//
//  SessionManager.swift
//  Horoscopo
//
//  Created by Tardes on 16/12/24.
//

import Foundation

class SessionManager {
    let defaults = UserDefaults.standard
    
    func setFavorite(horoscopeId: String) {
        defaults.set(horoscopeId, forKey: "favorite_horoscope")
    }

    func getFavorite() -> String {
        return defaults.string(forKey: "favorite_horoscope") ?? ""
    }

    func isFavorite(horoscopeId: String) -> Bool {
        return horoscopeId == getFavorite()
    }
}
