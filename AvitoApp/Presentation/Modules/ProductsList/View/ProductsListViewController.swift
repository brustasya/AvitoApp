//
//  ViewController.swift
//  AvitoApp
//
//  Created by Станислава on 27.08.2023.
//

import UIKit

class ProductsListViewController: UIViewController {

    private var output: ProductsListViewOutput

    private lazy var titleLabel = UILabel()
    private lazy var cancelButton = UIButton()
    private lazy var refreshControl = UIRefreshControl()
    private lazy var activityIndicator = UIActivityIndicatorView(style: .large)
    private lazy var errorView = UIView()
    private lazy var errorLabel = UILabel()
    private lazy var repeatButton = UIButton(type: .system)
    private lazy var textRepeatButton = UIButton(type: .system)
    
            
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 1.5
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: "ImageCell")
        return collectionView
    }()
    
   init(output: ProductsListViewOutput) {
        self.output = output
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupTitle()
        setupCollectionView()
        setupActivityIndicator()
        setupErrorView()
        setupErrorLabel()
        setupRepeatButton()
        setupTextRepeatButton()
        output.viewIsReady()
    }
    
    private func setupActivityIndicator() {
        activityIndicator.color = .gray
        activityIndicator.hidesWhenStopped = true
        activityIndicator.center = view.center
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 4),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -4),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.addSubview(refreshControl)
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)

    }
    
    private func setupTitle() {
        navigationItem.title = "Каталог товаров"
        navigationController?.navigationBar.prefersLargeTitles = true
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
        errorView.addSubview(errorLabel)
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
        activityIndicator.startAnimating()
        output.viewIsReady()
    }
    
    @objc func refreshData() {
        output.viewIsReady()
    }
}

extension ProductsListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return output.getProductsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "ImageCell",
            for: indexPath
        ) as? ProductCell else {
            fatalError("Unable to dequeue ImageCell")
        }

        output.addProduct(to: cell, at: indexPath.row)
        return cell
    }
}

extension ProductsListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            UIView.animate(withDuration: 0.1, animations: {
                cell.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            }) { _ in
                UIView.animate(withDuration: 0.2) {
                    cell.transform = .identity
                    self.output.productSelected(at: indexPath.row)
                }
            }
        }
    }
}

extension ProductsListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemWidth = (collectionView.frame.width) / 2
        return CGSize(width: itemWidth, height: itemWidth * 1.5)
    }
}

extension ProductsListViewController: ProductsListViewInput {
    func loadFinished() {
        activityIndicator.stopAnimating()
        refreshControl.endRefreshing()
        collectionView.reloadData()
        collectionView.reloadData()
    }
    
    func showError() {
        activityIndicator.stopAnimating()
        errorView.isHidden = false
        
        repeatButton.isHidden = false
        textRepeatButton.isHidden = false
        
        UIView.animate(withDuration: 0.2, animations: {
            self.errorLabel.isHidden = false
        })
    }
}

