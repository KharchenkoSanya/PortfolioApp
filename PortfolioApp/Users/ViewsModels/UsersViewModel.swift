import Foundation

final class UsersViewModel {
    var viewData: (([UserData]) -> Void)?
    var isLoadingData: ((Bool) -> Void)?
    
    init() {
        viewData?([])
    }
    
    func onRefresh() {
        isLoadingData?(true)
        var request = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/users")!)
        request.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, _, _ in
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode([UserData].self, from: data)
                DispatchQueue.main.async {
                    self.viewData?(result)
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
