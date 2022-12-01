
import Kingfisher
import SnapKit
import Then
import Cocoa
import AppKit

final class MatchCell: NSTableCellView{
    
    private let homeFlagImageView = NSImageView()
    
    private let homeTextView = NSTextView().then{
        $0.string = "Saudi Arabia"
        $0.backgroundColor = .clear
        $0.isSelectable = false
        $0.isSelectable = false
        $0.font = NSFont(name: "Helvetica", size: 12)
        $0.alignment = .center
    }
    
    private let awayTextView = NSTextView().then{
        $0.wantsLayer = true
        $0.string = "Argentina"
        $0.backgroundColor = .clear
        $0.isSelectable = false
        $0.isSelectable = false
        $0.font = NSFont(name: "Helvetica", size: 12)
        $0.alignment = .center
    }
    
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
        self.addSubview(awayTextView)
        
    }
    func setLayout(){

        homeFlagImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(10)
            make.size.equalTo(30)
        }
        
        homeTextView.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.bottom.equalToSuperview().inset(5)
            make.width.equalTo(90)
            make.height.equalTo(27)
        }
        
        awayTextView.snp.makeConstraints { make in
            make.right.equalTo(10)
            make.bottom.equalToSuperview().inset(5)
            make.width.equalTo(90)
            make.height.equalTo(27)
        }
    }
    func bind(model: MatchList) {
        DispatchQueue.main.async {
            self.homeTextView.string = model.home.teamName.first?.teamDescription ?? ""
            self.homeFlagImageView.kf.setImage(with: URL(string: "https://www.printableworldflags.com/icon-flags/48/Saudi Arabia.png"))
        }
    }
}
