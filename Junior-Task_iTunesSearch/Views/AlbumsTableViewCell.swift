//
//  AlbumsTableViewCell.swift
//  Junior-Task_iTunesSearch
//
//  Created by Akbarshah Jumanazarov on 6/11/23.
//

import UIKit

class AlbumsTableViewCell: UITableViewCell {

    private let albumLogo: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        image.backgroundColor = .red
        return image
    }()
    
    private let albumNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.text = "Album Name"
        return label
    }()
    
    private let artistNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.text = "Artist Name"
        return label
    }()
    
    private let trackCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.text = "10 tracks"
        label.textAlignment = .right
        return label
    }()
    
    private var stackViwe = UIStackView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        albumLogo.layer.cornerRadius = albumLogo.frame.size.height / 2
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        setConstarints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: Album) {
        if let urlString = model.artworkUrl100 {
            NetworkRequest.shared.requestData(urlString: urlString) { [weak self] result in
                switch result {
                case .success(let data):
                    let image = UIImage(data: data)
                    self?.albumLogo.image = image
                case .failure(let error):
                    print("No album logo" + error.localizedDescription)
                    self?.albumLogo.image = nil
                }
            }
        } else {
            albumLogo.image = nil
        }
        
        albumNameLabel.text = model.collectionName
        artistNameLabel.text = model.artistName
        trackCountLabel.text = "\(model.trackCount) tracks"
    }
    
    private func setup() {
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubview(albumLogo)
        contentView.addSubview(albumNameLabel)
        
        stackViwe = UIStackView(arrangedSubviews: [artistNameLabel, trackCountLabel])
        stackViwe.axis = .horizontal
        stackViwe.spacing = 10
        stackViwe.distribution = .fillProportionally
        stackViwe.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackViwe)
    }
    
    private func setConstarints() {
        NSLayoutConstraint.activate([
            albumLogo.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            albumLogo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            albumLogo.heightAnchor.constraint(equalToConstant: 60),
            albumLogo.widthAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            albumNameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            albumNameLabel.leadingAnchor.constraint(equalTo: albumLogo.trailingAnchor, constant: 10),
            albumNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant:-10)
        ])
        
        NSLayoutConstraint.activate([
            stackViwe.topAnchor.constraint(equalTo: albumNameLabel.bottomAnchor, constant: 10),
            stackViwe.leadingAnchor.constraint(equalTo: albumLogo.trailingAnchor, constant: 10),
            stackViwe.trailingAnchor.constraint (equalTo: self.trailingAnchor, constant: -10)
        ])
    }
}
