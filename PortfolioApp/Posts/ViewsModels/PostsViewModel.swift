import Foundation

final class PostsViewModel {
    private var userID: Int
    var postsViewData: (([PostsData]) -> Void)?
    var isLoadingData: ((Bool) -> Void)?
    
    init(userID: Int) {
        self.userID = userID
    }
    
    func onLoad() {
        postsViewData?([])
        postsURLRequest()
    }
    
    func postsURLRequest() {
        isLoadingData?(true)
        let urlComponents = URLComponents(string: "https://jsonplaceholder.typicode.com/users/\(userID)/posts")!
        var requestPosts = URLRequest(url: urlComponents.url!)
        requestPosts.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: requestPosts) { data, _, _ in
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode([PostsData].self, from: data)
                DispatchQueue.main.async {
                    self.postsViewData?(result)
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
