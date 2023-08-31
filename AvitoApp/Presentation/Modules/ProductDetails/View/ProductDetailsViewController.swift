//
//  ProductDetailViewController.swift
//  AvitoApp
//
//  Created by Станислава on 27.08.2023.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    private var output: productDetailsViewOutput
    
    private lazy var backgroundView = UIView()
    private lazy var productImageView = UIImageView()
    private lazy var titleLabel = UILabel()
    private lazy var priceLabel = UILabel()
    private lazy var locationLabel = UILabel()
    private lazy var createdDateLabel = UILabel()
    private lazy var descriptionLabel = UILabel()
    private lazy var emailLabel = UILabel()
    private lazy var phoneNumberLabel = UILabel()
    private lazy var addresLabel = UILabel()
    private lazy var scrollView = UIScrollView()
    private lazy var errorView = UIView()
    private lazy var errorLabel = UILabel()
    private lazy var repeatButton = UIButton(type: .system)
    private lazy var textRepeatButton = UIButton(type: .system)
    private lazy var activityIndicator = UIActivityIndicatorView(style: .large)
    
    init(output: productDetailsViewOutput) {
         self.output = output
         super.init(nibName: nil, bundle: nil)
     }
     
     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupScrollView()
        setupBackgroundView()
        setupNavBar()
        setupProductImageView()
        setupPriceLabel()
        setupTitleLabel()
        setupDescriptionLabel()
        setupLocationLabel()
        setupAddresLabel()
        setupEmailLabel()
        setupPhoneNumberLabel()
        setupCreatedDateLabel()
        setupErrorView()
        setupErrorLabel()
        setupRepeatButton()
        setupTextRepeatButton()
        setupActivityIndicator()
        output.viewIsReady()
    }
    
    private func setupBackgroundView() {
        scrollView.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: 600)
        scrollView.isScrollEnabled = true
        
        scrollView.isHidden = true
    }
    
    private func setupActivityIndicator() {
        activityIndicator.color = .gray
        activityIndicator.hidesWhenStopped = true
        activityIndicator.center = view.center
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    private func setupNavBar() {
        let backButton = UIBarButtonItem(
            image: UIImage(systemName: "arrow.left"),
            style: .done,
            target: self,
            action: #selector(goBack)
        )
        navigationItem.leftBarButtonItem = backButton
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.leftBarButtonItem?.width = 5
    }
    
    private func setupProductImageView() {
        backgroundView.addSubview(productImageView)
        productImageView.contentMode = .scaleAspectFit
        productImageView.backgroundColor = UIColor.systemGray6
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            productImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
    }
    
    private func setupPriceLabel() {
        backgroundView.addSubview(priceLabel)
        priceLabel.textColor = .black
        priceLabel.font = UIFont.boldSystemFont(ofSize: 20)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 16),
            priceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }
    
    private func setupTitleLabel() {
        backgroundView.addSubview(titleLabel)
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
    }
    
    private func setupDescriptionLabel() {
        backgroundView.addSubview(descriptionLabel)
        descriptionLabel.textColor = .gray
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    private func setupLocationLabel() {
        backgroundView.addSubview(locationLabel)
        locationLabel.textColor = .black
        locationLabel.numberOfLines = 0
        locationLabel.font = UIFont.systemFont(ofSize: 16)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            locationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    private func setupAddresLabel() {
        backgroundView.addSubview(addresLabel)
        addresLabel.textColor = .black
        addresLabel.numberOfLines = 0
        addresLabel.font = UIFont.systemFont(ofSize: 16)
        addresLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addresLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 4),
            addresLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            addresLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    private func setupEmailLabel() {
        backgroundView.addSubview(emailLabel)
        emailLabel.textColor = .black
        emailLabel.numberOfLines = 0
        emailLabel.font = UIFont.systemFont(ofSize: 16)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: addresLabel.bottomAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            emailLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    private func setupPhoneNumberLabel() {
        backgroundView.addSubview(phoneNumberLabel)
        phoneNumberLabel.textColor = .black
        phoneNumberLabel.numberOfLines = 0
        phoneNumberLabel.font = UIFont.systemFont(ofSize: 16)
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            phoneNumberLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            phoneNumberLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            phoneNumberLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    private func setupCreatedDateLabel() {
        backgroundView.addSubview(createdDateLabel)
        createdDateLabel.textColor = .gray
        createdDateLabel.numberOfLines = 0
        createdDateLabel.font = UIFont.systemFont(ofSize: 16)
        createdDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            createdDateLabel.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 20),
            createdDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            createdDateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            backgroundView.bottomAnchor.constraint(equalTo: createdDateLabel.bottomAnchor, constant: 8)
        ])
    }
    
    private func formateDate(dateString: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let date = dateFormatter.date(from: dateString) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "EEE, MMM d, yyyy"
            
            let formattedDate = outputFormatter.string(from: date)
            return formattedDate
        }
        return ""
    }
    
    private func setupErrorView() {
        view.addSubview(errorView)
        errorView.translatesAutoresizingMaskIntoConstraints = false
        errorView.backgroundColor = UIColor(rgb: "#e85454")
        errorView.layer.cornerRadius = 15
        
        NSLayoutConstraint.activate([
            errorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            errorView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            errorView.widthAnchor.constraint(equalToConstant: view.frame.width - 10),
            errorView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        errorView.isHidden = true
    }
    
    private func setupErrorLabel() {
        view.addSubview(errorLabel)
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.textColor = .white
        errorLabel.font = UIFont.systemFont(ofSize: 16)
        errorLabel.text = "Ошибка загрузки данных"
        
        NSLayoutConstraint.activate([
            errorLabel.centerYAnchor.constraint(equalTo: errorView.centerYAnchor),
            errorLabel.leadingAnchor.constraint(equalTo: errorView.leadingAnchor, constant: 10)
        ])
        
        errorLabel.isHidden = true
    }
    
    private func setupRepeatButton() {
        view.addSubview(repeatButton)
        repeatButton.translatesAutoresizingMaskIntoConstraints = false
        repeatButton.setImage(UIImage(systemName: "arrow.clockwise"), for: .normal)
        repeatButton.tintColor = .black
        
        repeatButton.addTarget(self, action: #selector(reloadData), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            repeatButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            repeatButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        repeatButton.isHidden = true
    }
    
    private func setupTextRepeatButton() {
        view.addSubview(textRepeatButton)
        textRepeatButton.translatesAutoresizingMaskIntoConstraints = false
        textRepeatButton.setTitle("Повторить", for: .normal)
        textRepeatButton.tintColor = .black
        textRepeatButton.addTarget(self, action: #selector(reloadData), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            textRepeatButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textRepeatButton.bottomAnchor.constraint(equalTo: repeatButton.topAnchor, constant: -8)
        ])
        
        textRepeatButton.isHidden = true
    }
    
    @objc func reloadData() {
        errorView.isHidden = true
        errorLabel.isHidden = true
        repeatButton.isHidden = true
        textRepeatButton.isHidden = true
        scrollView.isHidden = true
        activityIndicator.startAnimating()
        output.viewIsReady()
    }
    
    @objc private func goBack() {
        output.goBack()
    }
    
}

extension ProductDetailsViewController: ProductDetailsViewInput {
    func configure(with model: ProductDetailModel) {
        activityIndicator.stopAnimating()
        scrollView.isHidden = false
        titleLabel.text = model.title
        priceLabel.text = model.price
        descriptionLabel.text = model.description
        locationLabel.text = model.location
        addresLabel.text = model.address
        emailLabel.text = model.email
        phoneNumberLabel.text = model.phoneNumber
        createdDateLabel.text = formateDate(dateString: model.createdDate)
    }
    
    func addImage(with data: Data) {
        productImageView.image = UIImage(data: data)
    }
    
    func showError() {
        activityIndicator.stopAnimating()
        errorView.isHidden = false
        errorLabel.isHidden = false
        repeatButton.isHidden = false
        textRepeatButton.isHidden = false
        scrollView.isHidden = true
        
    }
}
