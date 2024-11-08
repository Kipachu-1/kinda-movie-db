//
//  ActorDetailsController.swift
//  kinda-movie-db
//
//  Created by Arsen Kipachu on 11/7/24.
//

import UIKit
import SnapKit


// MARK: - View Controller
class ActorDetailsViewController: UIViewController {
    
    // MARK: - Properties
    private let actor: Actor
    private var actorDetail: ActorDetail?
    
    private func fetchActorDetails() {
        let fetchedActorDetails = mockActorDetails.first { $0.id == actor.id }
        if(fetchedActorDetails == nil) {self.dismiss(animated: true)}
        
        actorDetail = fetchedActorDetails!
        
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
    init(actor: Actor) {
        self.actor = actor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        fetchActorDetails()
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
        title = actor.name
        navigationItem.largeTitleDisplayMode = .never
    }
    
    // MARK: - Helper Methods
    private func createStatsView() -> UIView {
        let containerView = UIView()
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        
        // Movies Count
        let moviesStack = createStatStack(
            value: "\(actorDetail?.stats.totalMovies ?? 0)",
            label: "Movies"
        )
        
        // Awards Count
        let awardsStack = createStatStack(
            value: "\(actorDetail?.stats.awards ?? 0)",
            label: "Awards"
        )
        
        // Average Rating
        let ratingStack = createStatStack(
            value: String(format: "%.1f", actorDetail?.stats.averageRating ?? 0),
            label: "Avg Rating"
        )
        
        stackView.addArrangedSubview(moviesStack)
        stackView.addArrangedSubview(awardsStack)
        stackView.addArrangedSubview(ratingStack)
        
        containerView.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
        
        return containerView
    }
    
    private func createStatStack(value: String, label: String) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 4
        
        let valueLabel = UILabel()
        valueLabel.text = value
        valueLabel.font = .systemFont(ofSize: 20, weight: .bold)
        
        let titleLabel = UILabel()
        titleLabel.text = label
        titleLabel.font = .systemFont(ofSize: 14, weight: .medium)
        titleLabel.textColor = .systemGray
        
        stack.addArrangedSubview(valueLabel)
        stack.addArrangedSubview(titleLabel)
        
        return stack
    }
}

// MARK: - UITableViewDelegate & DataSource
extension ActorDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4 // Profile, Stats, Bio, Known For
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.selectionStyle = .none
        
        switch indexPath.section {
        case 0: // Profile Image Section
            let profileImageView = UIImageView()
            profileImageView.backgroundColor = .systemGray5
            profileImageView.contentMode = .scaleAspectFill
            profileImageView.clipsToBounds = true
            profileImageView.layer.cornerRadius = 75
            cell.contentView.addSubview(profileImageView)
            
            profileImageView.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.top.bottom.equalToSuperview().inset(16)
                make.size.equalTo(150)
            }
            
        case 1: // Stats Section
            let statsView = createStatsView()
            cell.contentView.addSubview(statsView)
            
            statsView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            
        case 2: // Bio Section
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.spacing = 12
            cell.contentView.addSubview(stackView)
            
            stackView.snp.makeConstraints { make in
                make.edges.equalToSuperview().inset(16)
            }
            
            // Birth Info
            let birthInfoLabel = UILabel()
            birthInfoLabel.text = "Born: \(actorDetail?.birthDate ?? "") in \(actorDetail?.birthPlace ?? "")"
            birthInfoLabel.numberOfLines = 0
            birthInfoLabel.font = .systemFont(ofSize: 15)
            stackView.addArrangedSubview(birthInfoLabel)
            
            // Biography
            let bioLabel = UILabel()
            bioLabel.text = actorDetail?.biography
            bioLabel.numberOfLines = 0
            bioLabel.font = .systemFont(ofSize: 15)
            stackView.addArrangedSubview(bioLabel)
            
        case 3: // Known For Section
            let knownForCollectionView = createKnownForCollectionView()
            cell.contentView.addSubview(knownForCollectionView)
            
            knownForCollectionView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
                make.height.equalTo(200)
            }
            
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1: return "Career Statistics"
        case 2: return "Biography"
        case 3: return "Known For"
        default: return nil
        }
    }
}

// MARK: - Known For Collection View
extension ActorDetailsViewController {
    private func createKnownForCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 120, height: 200)
        layout.minimumInteritemSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(MovieCreditsCell.self, forCellWithReuseIdentifier: MovieCreditsCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }
}

// MARK: - UICollectionViewDelegate & DataSource
extension ActorDetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return actorDetail?.knownFor.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCreditsCell.identifier, for: indexPath) as? MovieCreditsCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: actorDetail!.knownFor[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dummyMovie = mockMovies[indexPath.item]
        let detailsVC = MovieDetailsViewController(movie: dummyMovie)
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}
