
import Kingfisher
import SnapKit
import Then
import Cocoa
import AppKit

final class MatchCell: NSTableCellView{
    
    private let homeFlagImageView = NSImageView()
    
    private let homeTextView = NSTextView().then{
        $0.wantsLayer = true
        $0.font = NSFont(name: "Helvetica", size: 16)
        $0.alignment = .center
        $0.textColor = NSColor.white
        $0.backgroundColor = .clear
        $0.string = "poland"
    }
    
    /*override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        addView()
        setLayout()
    }*/
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.identifier = NSUserInterfaceItemIdentifier("MatchCell")
        addView()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
            make.center.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(30)
        }
    }
    func bind(model: MatchList) {
        DispatchQueue.main.async {
            self.homeTextView.string = model.home.teamName.first?.teamDescription ?? ""
        }
    }
}
