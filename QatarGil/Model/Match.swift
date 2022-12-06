
import Foundation

struct Match: Codable{
    let matches: [MatchList]
}

struct MatchList: Codable{
    let groupName: [CompetitionName]
    let home: Home
    let away: Away
    let date: Date
    
    enum CodingKeys: String, CodingKey{
        case groupName = "GroupName"
        case home = "Home"
        case away = "Away"
        case date = "Date"
    }
}

struct CompetitionName: Codable{
    let groupDescription: String
    
    enum CodingKeys: String, CodingKey {
        case groupDescription = "Description"
    }
}

struct Away: Codable{
    let teamName: [AwayTeamName]
    let score: Int = 0
    
    enum CodingKeys: String, CodingKey{
        case teamName = "TeamName"
        case score = "Score"
    }
}

struct AwayTeamName: Codable{
    let teamDescription: String
    
    enum CodingKeys: String, CodingKey{
        case teamDescription = "Description"
    }
}

struct Home: Codable{
    let teamName: [HomeTeamName]
    let score: Int = 0
    
    enum CodingKeys: String, CodingKey{
        case teamName = "TeamName"
        case score = "Score"
    }
}

struct HomeTeamName: Codable {
    let teamDescription: String
    
    enum CodingKeys: String, CodingKey{
        case teamDescription = "Description"
    }
}

enum Country: String, Codable {
    case southKorea = "Korea Republic"
    case ghana = "Ghana"
    case serbia = "Serbia"
    case cameroon = "Cameroon"
    case qatar = "Qatar"
    case iran = "Iran"
    case saudiArabia = "Saudi Arabia"
    case japan = "Japan"
    case australia = "Australia"
    case senegal = "Senegal"
    case morocco = "Morocco"
    case tunisia = "Tunisia"
    case canada = "Canada"
    case mexico = "Mexico"
    case costarica = "Costa Rica"
    case usa = "United States"
    case brazil = "Brazil"
    case argentina = "Argentina"
    case uruguay = "Uruguay"
    case ecuador = "Ecuador"
    case germany = "Germany"
    case denmark = "Denmark"
    case france = "France"
    case belgium = "Belgium"
    case spain = "Spain"
    case croatia = "Croatia"
    case england = "England"
    case switzerland = "Switzerland"
    case netherlands = "Netherlands"
    case poland = "Poland"
    case portugal = "Portugal"
    case wales = "Wales"
    
    var display: String {
        switch self {
        case .southKorea: return "South Korea"
        case .ghana: return "Ghana"
        case .serbia: return "Serbia"
        case .cameroon: return "Cameroon"
        case .qatar: return "Qatar"
        case .iran: return "Iran"
        case .saudiArabia: return "Saudi Arabia"
        case .japan: return "Japan"
        case .australia: return "Australia"
        case .senegal: return "Senegal"
        case .morocco: return "Morocco"
        case .tunisia: return "Tunisia"
        case .canada: return "Canada"
        case .mexico: return "Mexico"
        case .costarica: return "Costa Rica"
        case .usa: return "United States of America"
        case .brazil: return "Brazil"
        case .argentina: return "Argentina"
        case .uruguay: return "Uruguay"
        case .ecuador: return "Ecuador"
        case .germany: return "Germany"
        case .denmark: return "Denmark"
        case .france: return "France"
        case .belgium: return "Belgium"
        case .spain: return "Spain"
        case .croatia: return "Croatia"
        case .england: return "England"
        case .switzerland: return "Switzerland"
        case .netherlands: return "Netherlands"
        case .poland: return "Poland"
        case .portugal: return "Portugal"
        case .wales: return "Wales"
        }
    }
}
