class MyTableViewController < UITableViewController
  def toggleFrameDrawing(sender)
    control = sender
    if control.selectedSegmentIndex == 0
      MyCellContentView.drawDebugFrame = false
      self.tableView.reloadData
    elsif control.selectedSegmentIndex == 1
      MyCellContentView.drawDebugFrame = true
      self.tableView.reloadData
    end
  end

  def initWithStyle(style)
    super

    @contents = []
    100.times do |i|
      @contents << Content.alloc.initWithNumber(i)
    end

    titles = ['None', 'Frame']
    control = UISegmentedControl.alloc.initWithItems(titles)
    control.setSegmentedControlStyle(UISegmentedControlStyleBar)
    control.addTarget(self, action: :'toggleFrameDrawing:', forControlEvents: UIControlEventValueChanged)
    self.navigationItem.titleView = control
    control.setSelectedSegmentIndex(MyCellContentView.drawDebugFrame ? 1 : 0)

    self.navigationItem.leftBarButtonItem = self.editButtonItem

    self
  end

  def numberOfSelectionsInTableView(tableView)
    1
  end

  def tableView(tableView, numberOfRowsInSection: section)
    @contents.count
  end

  def tableView(tableView, heightForRowAtIndexPath: indexPath)
    80
  end

  def tableView(tableView, canMoveRowAtIndexPath: indexPath)
    indexPath.row == 2
  end

  def tableView(tableView, moveRowAtIndexPath: fromIndexPath, toIndexPath: toIndexPath)
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    cellIdentifier = 'Cell'

    cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
    if cell.nil?
      cell = MyTableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier: cellIdentifier)
    end

    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator
    cell.setContent(@contents[indexPath.row])
    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath: indexPath)
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  end
end
