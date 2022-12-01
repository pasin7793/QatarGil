
import Foundation

/*struct Match: Codable{
    let matches: [MatchList]
}

struct MatchList: Codable{
    let groupName: [CompetitionName]
    let home: Home
    let away: Away
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
}

struct HomeTeamName: Codable{
    let teamDescription: String
    
    enum CodingKeys: String, CodingKey{
        case teamDescription = "Description"
    }
}*/

struct MatchResponse: Codable{
    let from, to: Date
    let matches: [Match]
}

// MARK: - Match
struct Match: Codable {
    let stageName, groupName, competitionName, seasonName: [CompetitionName]
    let date, localDate: Date
    let home, away: Away
    let stadium: Stadium
    let officials: [Official]
}

// MARK: - Away
struct Away: Codable {
    let teamType, ageType: Int
    let teamName: [CompetitionName]
    let abbreviation, shortClubName: String
    let footballType, gender: Int
    let idAssociation: String
}

// MARK: - CompetitionName
struct CompetitionName: Codable {
    let competitionNameDescription: String
}

// MARK: - Official
struct Official: Codable {
    let idCountry, officialID: String
    let nameShort, name: [CompetitionName]
    let officialType: Int
    let typeLocalized: [CompetitionName]
}

// MARK: - Stadium
struct Stadium: Codable {
    let idStadium: String
    let name: [CompetitionName]
    let roof: Bool
    let idCity: String
    let cityName: [CompetitionName]
    let idCountry: String
    let properties: Properties
}

// MARK: - Properties
struct Properties: Codable {
    let idIFES: String
}

//홈국가 이름, 어웨이국가 이름, 그룹, 시간(될 수 있으면), 국기이미지
