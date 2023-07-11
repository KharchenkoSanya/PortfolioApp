import Foundation

final class PostsViewModel {
    
    var postData: (([PostsData]) -> Void)?
    var isLoadingData: ((Bool) -> Void)?
    
    init() {
        postData?([])
    }
    
    func postsURLRequest() {
        isLoadingData?(true)
        var request = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/posts")!)
        request.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) { data, _, _ in
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode([PostsData].self, from: data)
                DispatchQueue.main.async {
                    self.postData?(result)
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
