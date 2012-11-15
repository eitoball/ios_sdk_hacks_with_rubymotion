class Content
  attr_reader :title
  attr_reader :icon

  def initWithNumber(num)
    initialize
    @title = '%040d' % num
    @icon = UIImage.imageNamed('2tchSmall.png')
    self
  end
end
