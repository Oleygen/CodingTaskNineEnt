//
//  ViewController.swift
//  NineTestApp
//
//  Created by oleygen-private on 07.05.2022.
//

import UIKit

class StoriesViewController: UIViewController {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var collectionView: UICollectionView!
    let viewModel = StoryListViewModel(storyService: StoryServiceImpl())
    fileprivate static let segueIdentifier = "showWebView"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        self.viewModel.fetch()
        bindElements()
    }
    
    // MARK: - segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == StoriesViewController.segueIdentifier {
            if let webVC = segue.destination as? WebViewController, let urlString = sender as? String {
                webVC.viewModel.item?.value = urlString
            } else {
                // non-fatal error should be tracked here
            }
        } else {
            // non-fatal error should be tracked here
        }
    }
    
    // MARK: - private methods
    
    private func setupCollectionView() {
        self.collectionView.register(UINib(nibName: "StoryCell", bundle: nil), forCellWithReuseIdentifier: StoryCell.identifier)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    private func createAlert(error: Error) -> UIAlertController {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        
        let retryAction = UIAlertAction(title: "Retry", style: .default) {[weak self] _ in
            self?.viewModel.fetch()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            alert.dismiss(animated: true)
        }
        alert.addAction(retryAction)
        alert.addAction(cancelAction)
        
        return alert
    }
    
    private func bindElements() {
        self.viewModel.items?.bind(listener: { _ in
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })
        
        self.viewModel.error?.bind(listener: { error in
            if let error = error {
                DispatchQueue.main.async {
                    let alert = self.createAlert(error: error)
                    self.present(alert, animated: true)
                }
            }
        })
        
        self.viewModel.isLoading.bind { isLoading in
            DispatchQueue.main.async {
                if isLoading ?? false {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }
        }
    }
}

// MARK: - Datasource & Delegate
extension StoriesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.items?.value?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCell.identifier, for: indexPath) as? StoryCell,
              let items = viewModel.items?.value,
              indexPath.row < items.count
        else {
            // non-fatal error should be tracked here
            return UICollectionViewCell()
        }

        cell.setup(items[indexPath.row])
        cell.accessibilityIdentifier = "StoryCell#\(indexPath.row)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let items = self.viewModel.items?.value, indexPath.row < items.count else {
            // non-fatal error should tracked here
            return
        }
   
        let item = items[indexPath.row]
        let urlString = item.url
        self.performSegue(withIdentifier: StoriesViewController.segueIdentifier, sender: urlString)
    }
}
