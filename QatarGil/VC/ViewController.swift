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
        /*$0.register(NSNib(nibNamed: "MatchCell", bundle: nil), forIdentifier: NSUserInterfaceItemIdentifier(rawValue: "MatchCell"))*/
        $0.makeView(withIdentifier: NSUserInterfaceItemIdentifier("MatchCell"), owner: ViewController.self)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.rowHeight = 200
    }
    
    private let viewModel = MainVM()
    
    func addView(){
        view.addSubview(tableView)
    }
    
    func setLayout(){
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        addView()
        setLayout()
    }

    override func loadView() {
        self.view = NSView(frame: NSRect(x: 0, y: 0, width: 400, height: 200))
        viewModel.fetchData { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
}

extension ViewController: NSTableViewDelegate, NSTableViewDataSource{
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let cellView = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: "MatchCell"), owner: self) as? MatchCell else {
                return NSTableCellView()
            }
        return cellView
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return viewModel.match.listener.debugDescription.count
    }
}
