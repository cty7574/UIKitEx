//
//  HeaderView.swift
//  StickyHeader
//
//  Created by 멘태 on 11/17/25.
//

import UIKit

final class TableHeaderView: UIView {
    private let mainImage: UIImageView = {
        let iv: UIImageView = UIImageView()
        iv.image = UIImage(systemName: "globe")
        iv.contentMode = .scaleAspectFill
        iv.tintColor = .black
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Apple Foods"
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let starImageView: UIImageView = {
        let iv: UIImageView = UIImageView()
        iv.image = UIImage(systemName: "star.fill")
        iv.contentMode = .scaleAspectFill
        iv.tintColor = .black
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let ratingLabel: UILabel = {
        let label: UILabel = UILabel()
        var attributedString: NSMutableAttributedString = .init(string: "4.5 ")
        attributedString.append(
            NSAttributedString(
                string: "(20K ratings) ",
                attributes: [
                    .font: UIFont.boldSystemFont(ofSize: 16)
                ]
            )
        )
        label.attributedText = attributedString
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let timeImageView: UIImageView = {
        let iv: UIImageView = UIImageView()
        iv.image = UIImage(systemName: "clock")
        iv.contentMode = .scaleAspectFill
        iv.tintColor = .black
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private let timeLabel: UILabel = {
        let label: UILabel = UILabel()
        var attributedString: NSMutableAttributedString = .init(string: "35-40 ")
        attributedString.append(
            NSAttributedString(
                string: "Mins",
                attributes: [
                    .font: UIFont.boldSystemFont(ofSize: 16)
                ]
            )
        )
        label.attributedText = attributedString
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var infomationStackView: UIStackView = {
        let st: UIStackView = UIStackView(arrangedSubviews: [starImageView, ratingLabel, timeImageView, timeLabel])
        st.axis = .horizontal
        st.spacing = 12
        st.distribution = .fill
        st.alignment = .center
        st.translatesAutoresizingMaskIntoConstraints = false
        return st
    }()
    
    let originalImageHeight: CGFloat = 250.0
    lazy var imageTopConstraint: NSLayoutConstraint = mainImage.topAnchor.constraint(equalTo: self.topAnchor)
    lazy var imageHeightConstraint: NSLayoutConstraint = mainImage.heightAnchor.constraint(equalToConstant: originalImageHeight)

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.addSubview(mainImage)
        self.addSubview(titleLabel)
        self.addSubview(infomationStackView)
        
        NSLayoutConstraint.activate([
            mainImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            mainImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            imageTopConstraint,
            imageHeightConstraint,
            
            titleLabel.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: mainImage.leadingAnchor),
            
            infomationStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            infomationStackView.leadingAnchor.constraint(equalTo: mainImage.leadingAnchor),
            infomationStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            
            starImageView.widthAnchor.constraint(equalToConstant: 15),
            starImageView.heightAnchor.constraint(equalTo: starImageView.widthAnchor),
            
            timeImageView.widthAnchor.constraint(equalTo: starImageView.widthAnchor),
            timeImageView.heightAnchor.constraint(equalTo: starImageView.heightAnchor)
        ])
    }
}
