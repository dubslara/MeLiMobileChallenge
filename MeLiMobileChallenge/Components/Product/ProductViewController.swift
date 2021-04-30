//
//  ProductViewController.swift
//  MeLiMobileChallenge
//
//  Created by Lara Dubs on 23/04/2021.
//

import UIKit
import SDWebImage
import SnapKit

final class ProductViewController: UIViewController {
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            self.conditionAndSoldCountLabel,
            self.descriptionLabel,
            self.thumbnailView,
            self.priceLabel
        ])
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()

    lazy var conditionAndSoldCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .callout)
        label.textAlignment = .left
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.numberOfLines = 2
        label.textAlignment = .left
        return label
    }()
    
    lazy var thumbnailView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints { make in
            make.height.equalTo(imageView.snp.width)
        }
        return imageView
    }()

    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        return label
    }()

    let viewModel: ViewModel
    
    init(product: Product) {
        self.viewModel = .init(product: product)
        super.init(nibName: nil, bundle: nil)
        edgesForExtendedLayout = []
    }
    
    required init?(coder: NSCoder) {
        fatalError("Incorrect initializer. Please call `init(product: Product`")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mainStackView)
        mainStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(16)
            make.left.right.equalToSuperview().inset(16)
        }

        conditionAndSoldCountLabel.text = viewModel.conditionAndSoldQuantity
        descriptionLabel.text = viewModel.description
        thumbnailView.sd_setImage(with: viewModel.thumbnail, completed: nil)
        priceLabel.text = viewModel.price
    }
}

