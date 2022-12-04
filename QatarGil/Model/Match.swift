
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
    let score: Int
    
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
    let score: Int
    
    enum CodingKeys: String, CodingKey{
        case teamName = "TeamName"
        case score = "Score"
    }
}

struct HomeTeamName: Codable{
    let teamDescription: String
    
    enum CodingKeys: String, CodingKey{
        case teamDescription = "Description"
    }
}
