//
//  UIViewController+Ext.swift
//  MarvelHeroes
//
//  Created by Lemi Developer on 12/1/20.
//

import UIKit
import SafariServices

extension UIViewController {
    func presentSafariViewController(with url: URL) {
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true)
    }
}
