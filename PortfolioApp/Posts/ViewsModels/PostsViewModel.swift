import Foundation

final class PostsViewModel {
    
    var postData: (([PostsData]) -> Void)?
    var isLoadingData: ((Bool) -> Void)?
    var postID: String
    
    init(postID: String) {
        self.postID = postID
    }
    
    func onLoad() {
        postData?([])
        postsURLRequest()
        
    }
    
    func postsURLRequest() {
        isLoadingData?(true)
        var urlComponents = URLComponents(string: "https://jsonplaceholder.typicode.com/posts")!
        urlComponents.queryItems = [URLQueryItem(name: "post_id", value: postID)]
        var requestPosts = URLRequest(url: urlComponents.url!)
        requestPosts.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: requestPosts) { data, _, _ in
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
