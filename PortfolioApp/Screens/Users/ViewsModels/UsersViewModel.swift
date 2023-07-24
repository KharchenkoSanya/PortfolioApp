import Foundation

final class UsersViewModel {
    var usersViewData: (([UserData]) -> Void)?
    var isLoadingData: ((Bool) -> Void)?
    
    init() {
        usersViewData?([])
    }
    
    func onLoad() {
        usersViewData?([])
        usersURLRequest()
    }
    
    func usersURLRequest() {
        isLoadingData?(true)
        var request = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/users")!)
        request.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, _, _ in
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode([UserData].self, from: data)
                DispatchQueue.main.async {
                    self.usersViewData?(result)
                    self.isLoadingData?(false)
                }
            } catch {
                DispatchQueue.main.async {
                    self.isLoadingData?(false)
                }
            }
        }
        task.resume()
    }
}
