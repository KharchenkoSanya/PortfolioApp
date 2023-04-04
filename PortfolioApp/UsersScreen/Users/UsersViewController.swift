import UIKit

class UsersTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users"
        
        var request = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/users")!)
        request.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: request) { data, _, error in
            guard let data = data else { return }
            
            do {
                let result = try JSONDecoder().decode([User].self, from: data)
                print("DECODING RESULT \(result)")
            } catch {
                print("decoding ERROR \(error)")
            }
        }
            task.resume()
        }
        
    override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 0
        }
    }
