//
//  MovieListDelegate.swift
//  movies
//
//  Created by bruno.luebke.moreira on 26/09/22.
//

import UIKit

final class MovieListDelegate: NSObject, UICollectionViewDelegateFlowLayout {

    private enum Layout: CGFloat {
        case itensSpacing = 8
        case cellRatio = 1.25
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (UIScreen.main.bounds.width - (3 * Layout.itensSpacing.rawValue)) / 2
        let height: CGFloat = width * Layout.cellRatio.rawValue

        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Layout.itensSpacing.rawValue
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Layout.itensSpacing.rawValue
    }

}
