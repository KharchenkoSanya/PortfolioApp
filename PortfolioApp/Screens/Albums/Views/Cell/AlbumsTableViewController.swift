import UIKit

final class AlbumsTableViewController: UITableViewController {
    private var modelAlbums: [AlbumData] = []
    private var albumsViewModel: AlbumsViewModel
    
    init(viewModel: AlbumsViewModel) {
        self.albumsViewModel = viewModel
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        bindToAlbumsViewModel()
        albumsViewModel.onLoad()
    }
    
    private func bindToAlbumsViewModel() {
        albumsViewModel.isLoadingData = { [weak self] isLoading in
            if isLoading {
                self?.tableView.refreshControl?.beginRefreshing()
            } else {
                self?.tableView.refreshControl?.endRefreshing()
            }
        }
        
        albumsViewModel.albumsViewData = { [weak self] albums in
            self?.modelAlbums = albums
            self?.tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelAlbums.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let album = modelAlbums[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: AlbumTableViewCell.identifier, for: indexPath) as! AlbumTableViewCell
        cell.setup(album: album)
        return cell
    }
    
    private func configureTableView() {
        title = "Album.title".localized
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(.init(nibName: AlbumTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: AlbumTableViewCell.identifier)
    }
}
