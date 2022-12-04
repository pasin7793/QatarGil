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
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.rowHeight = 100
        $0.headerView = nil
    }
    
    private var mainColumn = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(rawValue: "MatchCell")).then{
        $0.minWidth = 360
    }
    
    private let viewModel = MainVM()
    
    private let mainTextView = NSTextView().then{
        $0.wantsLayer = true
        $0.string = "Today's Match"
        $0.backgroundColor = .clear
        $0.isSelectable = false
        $0.isSelectable = false
        $0.font = NSFont(name: "Helvetica-Bold", size: 13)
        $0.alignment = .center
    }
    
    
    func addView(){
        view.addSubview(tableView)
        view.addSubview(mainTextView)
    }
    
    func setLayout(){
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(NSEdgeInsets(top: 30, left: 0, bottom: 0, right: 0))
        }
        mainTextView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(15)
            make.height.equalTo(30)
            make.width.equalTo(100)
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
        return viewModel.match.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell =  MatchCell()
        cell.bind(model: viewModel.match[row])
        return cell
    }
}
