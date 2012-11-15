class RootViewController < MyTableViewController
  def viewWillAppear(animated)
    super
    toggle = UIBarButtonItem.alloc.initWithTitle('Toggle', style: UIBarButtonItemStyleBordered, target: self, action: :'toggle:')
    self.navigationItem.rightBarButtonItem = toggle
  end

  def toggle(sender)
    nav = SecondViewController.navigationController
    nav.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal
    self.presentModalViewController(nav, animated: true)
  end
end
