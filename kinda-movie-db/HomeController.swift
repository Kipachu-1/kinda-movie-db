//
//  ViewController.swift
//  kinda-movie-db
//
//  Created by Arsen Kipachu on 11/7/24.
//
import UIKit
import SnapKit

// MARK: - View


// MARK: - Controller
class HomeViewController: UIViewController {
    
    // MARK: - Properties
    private var movies: [Movie] = []
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 16
        layout.minimumLineSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
          super.viewDidLoad()
          setupUI()
          setupNavigationBar()
          loadDummyData()
          
          // Add this to ensure collection view doesn't go under tab bar
          if #available(iOS 11.0, *) {
              collectionView.contentInsetAdjustmentBehavior = .always
          }
      }
    
    // MARK: - Setup
    private func setupUI() {
            view.backgroundColor = .systemBackground
            view.addSubview(collectionView)
            
            collectionView.snp.makeConstraints { make in
                make.top.leading.trailing.equalToSuperview()
                if #available(iOS 11.0, *) {
                    make.bottom.equalTo(view.safeAreaLayoutGuide)
                } else {
                    make.bottom.equalToSuperview()
                }
            }
        }
    
    private func setupNavigationBar() {
        title = "Movies"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func loadDummyData() {
        // In a real app, this would come from an API
        movies = mockMovies
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegate & DataSource
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.identifier, for: indexPath) as? MovieCell else {
            return UICollectionViewCell()
        }
        cell.configure(with: movies[indexPath.item])
        return cell
    }
    
    // In HomeViewController
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dummyMovie = mockMovies[indexPath.item]
        let detailsVC = MovieDetailsViewController(movie: dummyMovie)
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 48) / 2 // 48 = padding (16 * 3)
        return CGSize(width: width, height: width * 2) // Height includes space for title
    }
}
