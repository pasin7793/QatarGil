
import Foundation
import SnapKit
import Then
import Cocoa
import AppKit

final class MatchCell: NSTableCellView{
    
    private let beerImage = NSImageView()
    
    private let descriptionLabel = NSTextView().then{
        $0.font = NSFont(name: "Helvetica-bold", size: 16)
        $0.alignment = .center
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        addView()
        setLayout()
    }
    
    func addView() {
        self.addSubview(beerImage)
        self.addSubview(descriptionLabel)
    }
    func setLayout(){
        
        beerImage.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(135)
            make.top.equalTo(descriptionLabel)
            make.left.equalTo(21)
        }
        descriptionLabel.snp.makeConstraints { make in
            make.width.equalTo(232)
            make.height.equalTo(100)
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    func bind(model: Match) {
        DispatchQueue.main.async {
            self.beerImage.kf.setImage(with: URL(string: model.imageUrl))
            self.descriptionLabel.text = model.description
        }
    }
}
