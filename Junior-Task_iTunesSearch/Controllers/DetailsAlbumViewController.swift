//
//  DetailsAlbumViewController.swift
//  Junior-Task_iTunesSearch
//
//  Created by Akbarshah Jumanazarov on 6/11/23.
//

import UIKit

class DetailsAlbumViewController: UIViewController {
    
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
        label.numberOfLines = 0
        label.text = "Album Name"
        return label
    }()
    
    private let artistNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Album Name"
        return label
    }()
    
    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Release date"
        return label
    }()
    
    private let trackCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "10 tracks"
        return label
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .systemBackground
        view.bounces = false
        view.register(SongsCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var stackView = UIStackView()
    var album: Album?

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        setConstraints()
        setDelegates()
        setModel()
    }
    
    private func setup() {
        view.backgroundColor = .systemBackground
        stackView = UIStackView(arrangedSubviews: [albumNameLabel,
                                                  artistNameLabel,
                                                  releaseDateLabel,
                                                  trackCountLabel])
        stackView.spacing = 10
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(albumLogo)
        view.addSubview(stackView)
        view.addSubview(collectionView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            albumLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            albumLogo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            albumLogo.heightAnchor.constraint(equalToConstant: 100),
            albumLogo.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            stackView.leadingAnchor.constraint(equalTo: albumLogo.trailingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 100),
        ])
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: albumLogo.trailingAnchor, constant: 17),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        ])
    }
    
    private func setDelegates() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setModel() {
        guard let album = album else {return}
        
        albumNameLabel.text = album.collectionName
        artistNameLabel.text = album.artistName
        trackCountLabel.text = "\(album.trackCount) tracks"
        releaseDateLabel.text = setDateFormat(date: album.releaseDate)
        
        guard let url = album.artworkUrl100 else {return}
        setImage(urlString: url)
    }
    
    private func setDateFormat(date: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
        guard let backendDate = formatter.date(from: date) else {return ""}
        let formatDate = DateFormatter()
        formatDate.dateFormat = "dd-MM-yyyy"
        let date = formatDate.string(from: backendDate)
        return date
    }
    
    private func setImage(urlString: String?) {
        if let url = urlString {
            NetworkRequest.shared.requestData(urlString: url) { [weak self] result in
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
    }
}

extension DetailsAlbumViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SongsCollectionViewCell
        cell.nameSongLabel.text = "Name song"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 20)
    }
}
