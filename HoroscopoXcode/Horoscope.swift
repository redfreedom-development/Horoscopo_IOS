import Foundation
import UIKit

struct Horoscope {
    
    let id: String
    let name: String
    let icon: UIImage
    let dates: String
    
    static func getAll() -> [Horoscope] {
        
        return [
            Horoscope(id: "1", name: "Aries", icon: UIImage(named: "icon_horoscope/aries")!, dates: "March 21st - April 19th"),
            Horoscope(id: "2", name: "Taurus", icon: UIImage(named: "icon_horoscope/taurus")!, dates: "April 20th - May 20th"),
            Horoscope(id: "3", name: "Gemini", icon: UIImage(named: "icon_horoscope/gemini")!, dates: "May 21st - June 20th"),
            Horoscope(id: "4", name: "Cáncer", icon: UIImage(named: "icon_horoscope/cancer")!, dates: "June 21st - July 22nd"),
            Horoscope(id: "5", name: "Leo", icon: UIImage(named: "icon_horoscope/leo")!, dates: "July 23rd - August 22nd"),
            Horoscope(id: "6", name: "Virgo", icon: UIImage(named: "icon_horoscope/virgo")!, dates: "August 23rd - September 22nd"),
            Horoscope(id: "7", name: "Libra", icon: UIImage(named: "icon_horoscope/libra")!, dates: "September 23rd - October 22nd"),
            Horoscope(id: "8", name: "Scorpio", icon: UIImage(named: "icon_horoscope/scorpio")!, dates: "October 23rd - November 21st"),
            Horoscope(id: "9", name: "Sagittarius", icon: UIImage(named: "icon_horoscope/sagittarius")!, dates: "November 22nd - December 21st"),
            Horoscope(id: "10", name: "Capricorn", icon: UIImage(named: "icon_horoscope/capricorn")!, dates: "December 22nd - January 19th"),
            Horoscope(id: "11", name: "Aquarius", icon: UIImage(named: "icon_horoscope/aquarius")!, dates: "January 20th - February 18th"),
            Horoscope(id: "12", name: "Pisces", icon: UIImage(named: "icon_horoscope/pisces")!, dates: "February 19th - March 20th")
        ]
    }
}
