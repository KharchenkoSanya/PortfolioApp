import Foundation

final class AlbumsViewModel {
    private var userID: Int
    var albumsViewData: (([AlbumData]) -> Void)?
    var isLoadingData: ((Bool) -> Void)?
    
    init(userID: Int) {
        self.userID = userID
    }
    
    func onLoad() {
        albumsViewData?([])
        albumsURLRequest()
    }
    
    private func albumsURLRequest() {
        isLoadingData?(true)
        let urlComponents = URLComponents(string: "https://jsonplaceholder.typicode.com/users/\(userID)/albums")!
        var requestAlbums = URLRequest(url: urlComponents.url!)
        requestAlbums.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: requestAlbums) { data, _, _ in
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode([AlbumData].self, from: data)
                DispatchQueue.main.async {
                    self.albumsViewData?(result)
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
