import Foundation

final class PhotosViewModel {
    private var userID: Int
    var photoViewData: (([PhotosData]) -> Void)?
    var isLoadingData: ((Bool) -> Void)?
    
    init(userID: Int) {
        self.userID = userID
    }
    
    func onLoad() {
        photoViewData?([])
        photosURLRequest()
    }
    
    private func photosURLRequest() {
        isLoadingData?(true)
        let urlComponents = URLComponents(string: "https://jsonplaceholder.typicode.com/users/\(userID)/photos")!
        var requestPhotos = URLRequest(url: urlComponents.url!)
        requestPhotos.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: requestPhotos) { data, _, _ in
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode([PhotosData].self, from: data)
                DispatchQueue.main.async {
                    self.photoViewData?(result)
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
