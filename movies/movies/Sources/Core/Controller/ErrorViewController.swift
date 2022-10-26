//
//  ErrorViewController.swift
//  movies
//
//  Created by matheus.coutinho on 26/10/22.
//

import UIKit

class ErrorViewController: UIViewController {

    var mainView: ErrorView {
        return view as! ErrorView // swiftlint:disable:this force_cast
    }

    private let error: ErrorModel

    override func loadView() {
        view = ErrorView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.model = error
    }

    init(error: ErrorModel) {
        self.error = error
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
