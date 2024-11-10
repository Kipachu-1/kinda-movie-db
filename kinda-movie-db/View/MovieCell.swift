//
//  MovieCell.swift
//  kinda-movie-db
//
//  Created by Arsen Kipachu on 11/7/24.
//

import UIKit
import SnapKit
import SDWebImage


class MovieCell: UICollectionViewCell {
    static let identifier = "MovieCell"
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemGray5
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.addSubview(posterImageView)
        contentView.addSubview(titleLabel)
        
        posterImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(contentView.snp.width).multipliedBy(1.5)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(posterImageView.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(4)
            make.bottom.equalToSuperview()
        }
    }
    
    func configure(with movie: Movie) {
        titleLabel.text = movie.title
        // In a real app, you would load the image here
        guard let url = URL(string: movie.posterImage) else { return }
           
           // Set contentMode to center for placeholder image
           posterImageView.contentMode = .center
           let placeholderImage = UIImage(systemName: "photo")
           
           posterImageView.sd_setImage(with: url, placeholderImage: placeholderImage, options: [], completed: { [weak self] _, _, _, _ in
               // Change contentMode back to aspectFill after the image is loaded
               self?.posterImageView.contentMode = .scaleAspectFill
           })
    }
}
