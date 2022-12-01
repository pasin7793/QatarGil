
import Foundation

struct Match: Codable{
    let matches: [MatchList]
}

struct MatchList: Codable{
    let groupName: [CompetitionName]
    let home: Home
    let away: Away
    
    enum CodingKeys: String, CodingKey{
        case groupName = "GroupName"
        case home = "Home"
        case away = "Away"
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
    
    enum CodingKeys: String, CodingKey{
        case teamName = "TeamName"
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
    
    enum CodingKeys: String, CodingKey{
        case teamName = "TeamName"
    }
}

struct HomeTeamName: Codable{
    let teamDescription: String
    
    enum CodingKeys: String, CodingKey{
        case teamDescription = "Description"
    }
}



/*struct MatchResponse: Codable{
    let from, to: Date
    let matches: [Match]
}

// MARK: - Match
struct Match: Codable {
    let groupName, competitionName: [CompetitionName]
    let home, away: Away
    
    enum CodingKeys: String, CodingKey{
        case groupName = "GroupName"
        case competitionName = "CompetitionName"
        case home = "Home"
        case away = "Away"
    }
}

// MARK: - Away
struct Away: Codable {
    let teamName: [CompetitionName]
    
    enum CodingKeys: String, CodingKey{
        case teamName = "TeamName"
    }
}

// MARK: - CompetitionName
struct CompetitionName: Codable {
    let competitionNameDescription: String
    
    enum CodingKeys: String, CodingKey{
        case competitionNameDescription = "Description"
    }
}*/

//홈국가 이름, 어웨이국가 이름, 그룹, 시간(될 수 있으면), 국기이미지
