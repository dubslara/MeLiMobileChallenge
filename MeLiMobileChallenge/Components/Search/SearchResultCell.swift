//
//  SearchResultCell.swift
//  MeLiMobileChallenge
//
//  Created by Lara Dubs on 23/04/2021.
//

import UIKit
import SDWebImage
import SnapKit

final class SearchResultCell: UITableViewCell {
    static var identifier: String {
        String(describing: SearchResultCell.self)
    }
    
    let thumbnailView: UIImageView = {
        let imageView = UIImageView()
        imageView.snp.makeConstraints { make in
            make.width.equalTo(imageView.snp.height)
        }
        return imageView
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .body)
        return label
    }()

    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()
    
    lazy var detailStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.descriptionLabel, self.priceLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()

    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.thumbnailView, self.detailStackView])
        stackView.axis = .horizontal
        return stackView
    }()
    
    func configure(_ product: Product) {
        thumbnailView.sd_setImage(with: product.thumbnail, completed: nil)
        descriptionLabel.text = product.title
        priceLabel.text = "$ \(product.price)"
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    func commonInit() {
        mainStackView.axis = .horizontal
        detailStackView.axis = .vertical

        contentView.addSubview(mainStackView)
        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }
    }
}



