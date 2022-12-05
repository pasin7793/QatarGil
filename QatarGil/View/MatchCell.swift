
import Kingfisher
import SnapKit
import Then
import Cocoa
import AppKit

final class MatchCell: NSTableCellView{
    
    private let homeFlagImageView = NSImageView()
    
    private let awayFlagImageView = NSImageView()
    
    private let homeTextView = NSTextView().then{
        $0.backgroundColor = .clear
        $0.isSelectable = false
        $0.isSelectable = false
        $0.font = NSFont(name: "Helvetica", size: 12)
        $0.alignment = .center
    }
    
    private let awayTextView = NSTextView().then{
        $0.wantsLayer = true
        $0.backgroundColor = .clear
        $0.isSelectable = false
        $0.isSelectable = false
        $0.font = NSFont(name: "Helvetica", size: 12)
        $0.alignment = .center
    }
    
    private let vsTextView = NSTextView().then{
        $0.wantsLayer = true
        $0.string = "VS"
        $0.backgroundColor = .clear
        $0.isSelectable = false
        $0.isSelectable = false
        $0.font = NSFont(name: "Helvetica-Bold", size: 10)
        $0.alignment = .center
    }
    
    private let homeScoreTextView = NSTextView().then{
        $0.wantsLayer = true
        $0.backgroundColor = .clear
        $0.isSelectable = false
        $0.isSelectable = false
        $0.font = NSFont(name: "Helvetica-Bold", size: 20)
        $0.alignment = .center
    }
    
    private let awayScoreTextView = NSTextView().then{
        $0.wantsLayer = true
        $0.backgroundColor = .clear
        $0.isSelectable = false
        $0.isSelectable = false
        $0.font = NSFont(name: "Helvetica-Bold", size: 20)
        $0.alignment = .center
    }
    
    private let groupNameTextView = NSTextView().then{
        $0.wantsLayer = true
        $0.backgroundColor = .clear
        $0.isSelectable = false
        $0.isSelectable = false
        $0.font = NSFont(name: "Helvetica", size: 12)
        $0.alignment = .right
    }
    
    private let viewModel = MainVM()
    
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
        self.addSubview(vsTextView)
        self.addSubview(awayFlagImageView)
        self.addSubview(homeScoreTextView)
        self.addSubview(awayScoreTextView)
        self.addSubview(groupNameTextView)
    }
    func setLayout(){

        homeFlagImageView.snp.makeConstraints { make in
            make.left.equalTo(28)
            make.bottom.equalToSuperview().inset(45)
            make.size.equalTo(30)
        }
        
        homeTextView.snp.makeConstraints { make in
            make.centerX.equalTo(homeFlagImageView)
            make.bottom.equalToSuperview().inset(5)
            make.width.equalTo(90)
            make.height.equalTo(27)
        }
        
        awayTextView.snp.makeConstraints { make in
            make.centerX.equalTo(awayFlagImageView)
            make.bottom.equalToSuperview().inset(5)
            make.width.equalTo(90)
            make.height.equalTo(27)
        }
        vsTextView.snp.makeConstraints { make in
            make.center.equalToSuperview().offset(5)
            make.size.equalTo(30)
        }
        
        awayFlagImageView.snp.makeConstraints { make in
            make.right.equalTo(-28)
            make.bottom.equalToSuperview().inset(45)
            make.size.equalTo(30)
        }
        
        homeScoreTextView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(vsTextView).offset(-60)
            make.size.equalTo(30)
        }
        
        awayScoreTextView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(vsTextView).offset(60)
            make.size.equalTo(30)
        }
        
        groupNameTextView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(15)
            make.height.equalTo(30)
            make.width.equalTo(60)
        }
    }
    func bind(model: MatchList){
        DispatchQueue.main.async {
            self.homeFlagImageView.kf.setImage(with: URL(string: "https://www.printableworldflags.com/icon-flags/48/\(model.home.teamName.first?.teamDescription.rawValue ?? "").png"))
            self.homeTextView.string = model.home.teamName.first?.teamDescription.rawValue ?? ""
            self.awayFlagImageView.kf.setImage(with: URL(string: "https://www.printableworldflags.com/icon-flags/48/\(model.away.teamName.first?.teamDescription ?? "").png"))
            self.awayTextView.string = model.away.teamName.first?.teamDescription ?? ""
            self.homeScoreTextView.string = "\(model.home.score)"
            self.awayScoreTextView.string = "\(model.away.score)"
            self.groupNameTextView.string = model.groupName.first?.groupDescription ?? ""
        }
    }
}
