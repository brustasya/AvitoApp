//
//  ImageCell.swift
//  AvitoApp
//
//  Created by Станислава on 27.08.2023.
//

import UIKit

class ProductCell: UICollectionViewCell {
    private lazy var productImageView = UIImageView()
    private lazy var titleLabel = UILabel()
    private lazy var priceLabel = UILabel()
    private lazy var locationLabel = UILabel()
    private lazy var createdDateLabel = UILabel()
    private lazy var id = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        setupImageView()
        setupTitleLabel()
        setupPriceLabel()
        setupLocationLabel()
        setupCreatedDateLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: Advertisement) {
        titleLabel.text = model.title
        priceLabel.text = model.price
        locationLabel.text = model.location
        createdDateLabel.text = formateDate(dateString: model.createdDate)
        id = model.id
    }
    
    func addImage(data: Data, id: String) {
        if (self.id == id) {
            productImageView.image = UIImage(data: data)
        }
    }
    
    private func formateDate(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = dateFormatter.date(from: dateString) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "MMM d, yyyy"
            
            let formattedDate = outputFormatter.string(from: date)
            return formattedDate
        }
        return ""
    }
    
    private func setupImageView() {
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(productImageView)
        
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            productImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            productImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            productImageView.heightAnchor.constraint(equalToConstant: contentView.frame.width - 16)
        ])
        
        backgroundColor = UIColor.systemGray4
        productImageView.image = UIImage(named: "imagePlaceholder")
        productImageView.layer.cornerRadius = 6
        productImageView.backgroundColor = .lightGray
        productImageView.contentMode = .scaleAspectFill
        productImageView.clipsToBounds = true
    }
    
    private func setupTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.numberOfLines = 2
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 15)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 4),
            titleLabel.leadingAnchor.constraint(equalTo: productImageView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: productImageView.trailingAnchor)
        ])
    }
    
    private func setupPriceLabel() {
        contentView.addSubview(priceLabel)
        priceLabel.numberOfLines = 1
        priceLabel.textColor = .black
        priceLabel.font = UIFont.boldSystemFont(ofSize: 15)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            priceLabel.leadingAnchor.constraint(equalTo: productImageView.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: productImageView.trailingAnchor)
        ])
    }
    
    private func setupLocationLabel() {
        contentView.addSubview(locationLabel)
        locationLabel.numberOfLines = 1
        locationLabel.textColor = .lightGray
        locationLabel.font = UIFont.systemFont(ofSize: 13)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 4),
            locationLabel.leadingAnchor.constraint(equalTo: productImageView.leadingAnchor),
            locationLabel.trailingAnchor.constraint(equalTo: productImageView.trailingAnchor)
        ])
    }
    
    private func setupCreatedDateLabel() {
        contentView.addSubview(createdDateLabel)
        createdDateLabel.numberOfLines = 1
        createdDateLabel.textColor = .lightGray
        createdDateLabel.font = UIFont.systemFont(ofSize: 13)
        createdDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            createdDateLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 2),
            createdDateLabel.leadingAnchor.constraint(equalTo: productImageView.leadingAnchor),
            createdDateLabel.trailingAnchor.constraint(equalTo: productImageView.trailingAnchor)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        productImageView.image = UIImage(named: "imagePlaceholder")
    }
}

