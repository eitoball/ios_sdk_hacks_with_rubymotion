class SecondViewController < MyTableViewController
  def self.navigationController
    viewCon = self.alloc.initWithStyle(UITableViewStyleGrouped)
    UINavigationController.alloc.initWithRootViewController(viewCon)
  end

  def viewWillAppear(animated)
    super
    toggle = UIBarButtonItem.alloc.initWithTitle('Toggle', style: UIBarButtonItemStyleBordered, target: self, action: :'toggle:')
    self.navigationItem.rightBarButtonItem = toggle
  end

  def toggle(sender)
    self.dismissModalViewControllerAnimated(true)
  end
end
