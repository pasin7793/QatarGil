import Foundation
import Alamofire
import AppKit
import Cocoa

final class MainVM{
    
    func getCurrentDate() -> String{
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let result = formatter.string(from: date)
        return result
    }
    
    
    private let urlString = "https://fifa-2022-schedule-and-stats.p.rapidapi.com/schedule?date=2022-12-7&utc_offset=10"
    //private let urlString = "asdf"
    
    var match: [MatchList] = []
    
    let headers: HTTPHeaders = [
        "X-RapidAPI-Key": "02f619197amsh44b871e7ad0a89ap1c7160jsn297f51764363",
        "X-RapidAPI-Host": "fifa-2022-schedule-and-stats.p.rapidapi.com"
    ]
    
    
    func fetchData(completion: @escaping ()->()) {
        AF.request(urlString,headers: headers).responseJSON { (response) in
            print(self.getCurrentDate())
            switch response.result {
            case .success(let res):
                do {
                    let decoder = JSONDecoder().then{
                        $0.dateDecodingStrategy = .iso8601
                    }
                    let jsonData = try JSONSerialization.data(withJSONObject: res, options: .prettyPrinted)
                    let json = try decoder.decode(Match.self, from: response.data!)
                    self.match = json.matches
                    print(self.match)
                    completion()
                    } catch let DecodingError.dataCorrupted(context) {
                        print(context)
                    } catch let DecodingError.keyNotFound(key, context) {
                        print("Key '\(key)' not found:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch let DecodingError.valueNotFound(value, context) {
                        print("Value '\(value)' not found:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch let DecodingError.typeMismatch(type, context)  {
                        print("Type '\(type)' mismatch:", context.debugDescription)
                        print("codingPath:", context.codingPath)
                    } catch {
                        print("error: ", error)
                } catch(let err) {
                    print(err.localizedDescription)
                    
                }
                
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
    
}
