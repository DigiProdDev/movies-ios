//
//  ErrorView.swift
//  movies
//
//  Created by matheus.coutinho on 26/10/22.
//

import UIKit

class ErrorView: UIView {

    private(set) var stackView: UIStackView
    private(set) var errorImageView: UIImageView
    private(set) var messageLabel: UILabel

    var model: ErrorModel? {
        didSet {
            update()
        }
    }

    override init(frame: CGRect = .zero) {
        errorImageView = UIImageView()
        messageLabel = UILabel()
        stackView = UIStackView()
        super.init(frame: frame)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func update() {
        guard let model else {
            return
        }
        if let image = setImage(errorType: model.errorType) {
            errorImageView.image = image
        }
        messageLabel.text = setMessage(model: model)
    }

    private func setImage(errorType: ErrorType) -> UIImage? {
        switch errorType {
        case .generic:
            return UIImage(named: Images.error.rawValue)
        case .emptySearch:
            return UIImage(named: Images.search.rawValue)
        }
    }

    private func setMessage(model: ErrorModel) -> String {
        switch model.errorType {
        case .generic:
            return model.message
        case .emptySearch:
            return "Sua busca por \"\(model.message)\" não encontrou nenhum resultado"
        }
    }

}

extension ErrorView: ViewCodable {

    func configure() {
        self.backgroundColor = .white
        stackView.translatesAutoresizingMaskIntoConstraints = false
    }

    func buildHierarchy() {
        addSubview(stackView)
        [errorImageView, messageLabel].forEach(stackView.addArrangedSubview)
    }

    func buildConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
        ])
    }

    func render() {
        stackView.distribution = .fillProportionally
        stackView.spacing = 20
        stackView.axis = .vertical

        errorImageView.contentMode = .scaleAspectFit

        messageLabel.numberOfLines = 2
        messageLabel.font = .systemFont(ofSize: 25, weight: .bold)
        messageLabel.textColor = .black
        messageLabel.textAlignment = .center
    }

}
