//
//  DetailViewController.swift
//  MeliChallenge2022
//
//  Created by Santiago Balestero on 29/7/22.
//

import UIKit
import SDWebImage

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var quantityLabel: UILabel!
    var product: ProductModel? {
        didSet {
            refresh()
        }
    }
    
    private func refresh() {
        loadViewIfNeeded()
        titleLabel.text = formattedTitle()
        priceLabel.text = "\(product?.currency ?? "") \(product?.price ?? 0.0)"
        quantityLabel.text = product?.quantity ?? 0 > 1 ? "\(product?.quantity ?? 0) disponibles"
        : "\(product?.quantity ?? 0) disponible"
        imageView.sd_imageIndicator = SDWebImageActivityIndicator.large
        imageView.sd_setImage(with: URL(string: product?.image ?? ""), placeholderImage: UIImage(named: "placeholder"))
    }
    
    private func formattedTitle() -> String {
        return product?.title.components(separatedBy: "|")[0] ?? ""
//        return title?[0] ?? ""
    }
        @IBAction func onViewOnWebButtonTouchUpInside(_ sender: Any) {
        if let link = URL(string: product?.permalink ?? "") {
          UIApplication.shared.open(link)
        }
    }
    
}
