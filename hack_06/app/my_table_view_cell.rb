class MyTableViewCell < UITableViewCell
  attr_accessor :content

  def initWithStyle(style, reuseIdentifier: reuseIdentifier)
    super
    @myContentView = MyCellContentView.alloc.initWithFrame(self.contentView.frame, withCell: self)
    @myContentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight
    @myContentView.contentMode = UIViewContentModeLeft
    self.contentView.addSubview(@myContentView)
    self
  end

  def setHighlighted(highlighted, animated: animated)
    super
    @myContentView.highlighted = highlighted
  end
  alias_method :hightlighted=, :setHighlighted

  def setSelected(selected, animated: animated)
    super
  end
  alias_method :selected=, :setSelected

  def setBackgroundColor(backgroundColor)
    super
    @myContentView.backgroundColor = backgroundColor
  end
  alias_method :backgroundColor=, :setBackgroundColor
end
