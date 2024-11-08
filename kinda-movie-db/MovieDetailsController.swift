//
//  MovieDetailsController.swift
//  kinda-movie-db
//
//  Created by Arsen Kipachu on 11/7/24.
//

import UIKit
import SnapKit



// MARK: - View Controller
class MovieDetailsViewController: UIViewController {
    
    // MARK: - Properties
    private var movie: Movie
    private var movieDetail: MovieDetail?
    
    
    private  func fetchMovieDetails() {
        let fetchedData = mockMovieDetails.first { $0.id == movie.id }
        if(fetchedData == nil) {
            self.dismiss(animated: true)
        }
        movieDetail = fetchedData;
    }
    
    private lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.delegate = self
        tv.dataSource = self
        tv.separatorStyle = .none
        tv.backgroundColor = .systemBackground
        return tv
    }()
    
    // MARK: - Initialization
    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        fetchMovieDetails()
        super.viewDidLoad()
        setupUI()
        setupNavigationBar()
    }
    
    // MARK: - Setup
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupNavigationBar() {
        title = movie.title
        navigationItem.largeTitleDisplayMode = .never
        
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"),
                                       style: .plain,
                                       target: self,
                                       action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UITableViewDelegate & DataSource
extension MovieDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4 // Poster, Info, Overview, Cast
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        
        switch indexPath.section {
        case 0: // Poster Section
            let posterImageView = UIImageView()
            posterImageView.backgroundColor = .systemGray5
            posterImageView.contentMode = .scaleAspectFill
            posterImageView.clipsToBounds = true
            cell.contentView.addSubview(posterImageView)
            
            posterImageView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
                make.height.equalTo(300)
            }
            
        case 1: // Info Section
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.spacing = 8
            cell.contentView.addSubview(stackView)
            
            stackView.snp.makeConstraints { make in
                make.edges.equalToSuperview().inset(16)
            }
            
            // Rating
            let ratingLabel = UILabel()
            ratingLabel.text = "Rating: ⭐️ \(movieDetail?.rating ?? 0.0)/10"
            stackView.addArrangedSubview(ratingLabel)
            
            // Duration
            let durationLabel = UILabel()
            durationLabel.text = "Duration: \(movieDetail?.duration ?? "None")"
            stackView.addArrangedSubview(durationLabel)
            
            // Release Date
            let releaseDateLabel = UILabel()
            releaseDateLabel.text = "Release Date: \(movieDetail?.releaseDate ?? "Unknown" )"
            stackView.addArrangedSubview(releaseDateLabel)
            
            // Genres
            let genresLabel = UILabel()
            genresLabel.text = "Genres: \(movieDetail?.genres.joined(separator: ", ") ?? "")"
            genresLabel.numberOfLines = 0
            stackView.addArrangedSubview(genresLabel)
            
        case 2: // Overview Section
            let overviewLabel = UILabel()
            overviewLabel.numberOfLines = 0
            overviewLabel.text = movieDetail?.overview
            cell.contentView.addSubview(overviewLabel)
            
            overviewLabel.snp.makeConstraints { make in
                make.edges.equalToSuperview().inset(16)
            }
            
        case 3: // Cast Section
            let castCollectionView = createCastCollectionView()
            cell.contentView.addSubview(castCollectionView)
            
            castCollectionView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
                make.height.equalTo(150)
            }
            
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 2: return "Overview"
        case 3: return "Cast"
        default: return nil
        }
    }
}

// MARK: - Cast Collection View
extension MovieDetailsViewController {
    private func createCastCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 130)
        layout.minimumInteritemSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CastCell.self, forCellWithReuseIdentifier: CastCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }
}

// MARK: - UICollectionViewDelegate & DataSource
extension MovieDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieDetail?.cast.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CastCell.identifier, for: indexPath) as? CastCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: movieDetail!.cast[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let actor = movieDetail?.cast[indexPath.item]
        if(actor == nil) { return }
        let actorDetailsVC = ActorDetailsViewController(actor: actor!)
        navigationController?.pushViewController(actorDetailsVC, animated: true)
    }
}
