
import Kingfisher
import SnapKit
import Then
import Cocoa
import AppKit

final class MatchCell: NSTableCellView{
    
    private let homeFlagImageView = NSImageView()
    
    private let homeTextView = NSTextView().then{
        $0.font = NSFont(name: "Helvetica-bold", size: 16)
        $0.alignment = .center
    }
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        addView()
        setLayout()
    }
    
    func addView() {
        self.addSubview(homeFlagImageView)
        self.addSubview(homeTextView)
    }
    func setLayout(){
        
        homeFlagImageView.snp.makeConstraints { make in
            make.width.equalTo(120)
            make.height.equalTo(135)
            make.top.equalTo(homeTextView)
            make.left.equalTo(21)
        }
        homeTextView.snp.makeConstraints { make in
            make.width.equalTo(232)
            make.height.equalTo(100)
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    func bind(model: MatchList) {
        DispatchQueue.main.async {
            self.homeTextView.string = model.home.teamName.first?.teamDescription ?? ""
        }
    }
}
