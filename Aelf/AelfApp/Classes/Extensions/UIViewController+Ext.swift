//
//  UIViewController+Ext.swift
//  RxExamples
//
//  Created by 晋先森 on 2019/5/29.
//  Copyright © 2019 AELF. All rights reserved.
//

import Foundation

extension UIViewController {

    func addBackItem() {

        let image = UIImage(named: "arrow-left")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(self.pop))
    }

    func addWhiteBackItem() {

        let image = UIImage(named: "back-white")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(self.pop))
    }

    func addEmptyBackItem() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: UIView())
    }

    @objc func pop() {
        self.navigationController?.popViewController(animated: true)
    }

    func push(controller:UIViewController) {
        controller.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(controller, animated: true)
    }

    func setTitleAttributes() {

        let attr = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium),
                    NSAttributedString.Key.foregroundColor: UIColor(hexString: "09162D")!]
        self.navigationController?.navigationBar.titleTextAttributes = attr

    }

    class func topViewController(base: UIViewController?
        = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }

}
