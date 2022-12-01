import Foundation
import Alamofire
import AppKit
import Cocoa

final class MainVM{
    
    private let urlString = "https://fifa-2022-schedule-and-stats.p.rapidapi.com/schedule?date=2022-12-1&utc_offset=10"
    var match: Observable<Match?> = Observable(nil)
    
    let headers: HTTPHeaders = [
        "X-RapidAPI-Key": "a79b2f5683msh987fcff324d41c2p1b8a32jsn5950af37856f",
        "X-RapidAPI-Host": "fifa-2022-schedule-and-stats.p.rapidapi.com"
    ]
    
    func fetchData(completion: @escaping ()->()) {
        AF.request(urlString, headers: headers).responseJSON { (response) in
            print(response)
            switch response.result {
            case .success:
                do {
                    let decoder = JSONDecoder()
                    let json = try decoder.decode(Match.self, from: response.data ?? .init())
                    self.match.value = json
                    print(self.match)
                    completion()
                } catch(let err) {
                    print(err.localizedDescription)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}
