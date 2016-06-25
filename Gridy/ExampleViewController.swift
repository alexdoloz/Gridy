import UIKit


class ExampleViewController: UIViewController {

    @IBOutlet weak var widthLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var spaceXLabel: UILabel!
    
    @IBOutlet weak var spaceYLabel: UILabel!
    
    @IBOutlet weak var anchorPointYLabel: UILabel!
    @IBOutlet weak var anchorPointXLabel: UILabel!
    
    @IBOutlet weak var anchorCellXLabel: UILabel!
    
    
    @IBOutlet weak var anchorCellYLabel: UILabel!
    
    @IBOutlet weak var hideShowButton: UIButton!
    
    @IBOutlet weak var menuView: UIVisualEffectView!
    
    
    @IBOutlet weak var containerView: UIView!
    
    var cellViews: [Cell: UIView] = [:]
    let cellsInRow = 10
    var grid: Grid4 = Grid4()
    
    // MARK: Controls
    
    @IBOutlet weak var widthSlider: UISlider!
    
    @IBOutlet weak var heightSlider: UISlider!
    
    @IBOutlet weak var spaceXSlider: UISlider!
    
    @IBOutlet weak var spaceYSlider: UISlider!
    
    @IBOutlet weak var anchorPointXSlider: UISlider!
    
    @IBOutlet weak var anchorPointYSlider: UISlider!
    
    @IBOutlet weak var anchorCellXStepper: UIStepper!
    
    @IBOutlet weak var anchorCellYStepper: UIStepper!
    
    @IBOutlet weak var anchorModeSegmentedControl: UISegmentedControl!
    
    
    @IBOutlet weak var menuConstraint: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupActions()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        updateGrid()
    }
    
    func setupActions() {
        let action = #selector(self.updateGrid)
        [
            widthSlider,
            heightSlider,
            spaceXSlider,
            spaceYSlider,
            anchorPointXSlider,
            anchorPointYSlider,
            anchorCellXStepper,
            anchorCellYStepper,
            anchorModeSegmentedControl
        ].forEach { control in
            control.addTarget(self, action: action, forControlEvents: .ValueChanged)
        }
    }
    
    func updateGrid() {
        grid.width = CGFloat(widthSlider.value)
        grid.height = CGFloat(heightSlider.value)
        grid.spaceX = CGFloat(spaceXSlider.value)
        grid.spaceY = CGFloat(spaceYSlider.value)
        grid.anchorPoint = CGPoint(x: CGFloat(anchorPointXSlider.value), y: CGFloat(anchorPointYSlider.value))
        grid.anchorCell = Cell(x: Int(anchorCellXStepper.value), y: Int(anchorCellYStepper.value))
        grid.anchorMode = Grid4.AnchorMode(rawValue: anchorModeSegmentedControl.selectedSegmentIndex)!
        
        updateUI()
    }
    
    func updateUI() {
        for x in 0..<cellsInRow {
            for y in 0..<cellsInRow {
                let cell = Cell(x: x, y: y)
                let cellView = cellViews[cell]!
                let newFrame = grid.rectForCell(cell)
                UIView.animateWithDuration(0.25) {
                    cellView.frame = newFrame
                }
            }
        }
    }
    
    func setupUI() {
        for x in 0..<cellsInRow {
            for y in 0..<cellsInRow {
                let cell = Cell(x: x, y: y)
                let cellView = UIView()
                cellView.backgroundColor = .yellowColor()
                containerView.addSubview(cellView)
                cellViews[cell] = cellView
            }
        }
    }
    
    
    @IBAction func hideShowPressed(sender: AnyObject) {
        let wasHidden = menuView.frame.maxY > view.bounds.maxY
        let hidden = !wasHidden
        let newTitle = hidden ? "Show" : "Hide"
        let newConstant = hidden ? -(menuView.frame.height - 40) : 0.0
        menuConstraint.constant = newConstant
        UIView.performWithoutAnimation {
            self.hideShowButton.setTitle(newTitle, forState: .Normal)
        }
        
        UIView.animateWithDuration(0.25) {
            self.view.layoutIfNeeded()
        }
    }
    
}

