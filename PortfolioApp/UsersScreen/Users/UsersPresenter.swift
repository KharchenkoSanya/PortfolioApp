import Foundation

protocol UsersView: AnyObject {
    func display(_ users: [User])
    func display(isLoading: Bool)
}

final class UsersPresenter {
    weak var view: UsersView?
    
    func onRefresh() {
        view?.display(isLoading: true)
        var request = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/users")!)
        request.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, _, _ in
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode([User].self, from: data)
                DispatchQueue.main.async {
                    self.view?.display(result)
                    self.view?.display(isLoading: false)
                }
            } catch {
                DispatchQueue.main.async {
                    self.view?.display(isLoading: false)
                }
            }
        }
        task.resume()
    }
    func onSelect(_ user: User) {
        print("SELECTED \(user)")
    }
}
