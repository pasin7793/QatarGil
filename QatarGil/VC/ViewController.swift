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
        //$0.makeView(withIdentifier: NSUserInterfaceItemIdentifier("MatchCell"), owner: MatchCell.self)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.rowHeight = 100
        //$0.addTableColumn(NSTableColumn(identifier: NSUserInterfaceItemIdentifier("MatchCel")))
        $0.headerView = nil
    }
    
    private var mainColumn = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(rawValue: "MatchCell")).then{
        $0.minWidth = 375
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
        tableView.addTableColumn(mainColumn)
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
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        //return viewModel.match?.matches.count ?? 0
        return 4
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        return viewModel.match?.matches[row]
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        return MatchCell()
    }
}
