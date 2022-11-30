//
//  ViewController.swift
//  QatarGil
//
//  Created by 임준화 on 2022/11/20.
//

import Cocoa
import SnapKit
import Then
import Kingfisher

class ViewController: NSViewController {

    private let tableView = NSTableView().then{
        $0.register(BeerCell.self, forCellReuseIdentifier: "cell")
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.rowHeight = 200
        $0.separatorStyle = .none
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

extension 

