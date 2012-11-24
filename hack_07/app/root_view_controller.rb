# -*- coding: utf-8 -*-

class RootViewController < UITableViewController
  def loadView
    self.view = NSBundle.mainBundle.loadNibNamed('RootViewController', owner: self, options: nil).first
  end

  def viewWillAppear(animated)
    super
    setTitle('Root')
  end

  def didReceiveMemoryWarning
    super
  end

  def viewDidUnload
  end

  def numberOfSectionsInTableView(tableView)
    1
  end

  def tableView(tableView, numberOfRowsInSection: section)
    1
  end

  CELL_IDENTIFIER = 'Cell'

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CELL_IDENTIFIER)
    if cell.nil?
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: CELL_IDENTIFIER)
    end

    cell.textLabel.text = 'do it'

    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath: indexPath)
    anotherViewController = TaskViewController.alloc.initWithNibName(nil, bundle: nil)
    self.navigationController.pushViewController(anotherViewController, animated: true)
  end
end
