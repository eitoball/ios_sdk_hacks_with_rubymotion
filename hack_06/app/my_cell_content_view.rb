class MyCellContentView < UIView

  class << self
    attr_reader :drawDebugFrame

    @drawDebugFrame = false

    def setDrawDebugFrame(newValue)
      @drawDebugFrame = newValue
    end
    alias_method :drawDebugFrame=, :setDrawDebugFrame
  end

  def initWithFrame(frame, withCell: newcell)
    initWithFrame(frame)
    @cell = newcell
    self.setBackgroundColor(UIColor.clearColor)
    self
  end

  def setHighlited(newValue)
    @highlighted = newValue
    self.setNeedsDisplay
  end
  alias_method :highlighted=, :setHighlited

  def setFrame(frame)
    super
    self.setNeedsDisplay
  end
  alias_method :frame=, :setFrame

  def drawRect(rect)
    if self.class.drawDebugFrame
      context = UIGraphicsGetCurrentContext()
      UIColor.colorWithRed(1, green: 0, blue: 0, alpha: 0.1).setFill
      UIColor.colorWithRed(1, green: 0, blue: 0, alpha: 1).setStroke
      CGContextSetLineWidth(context, 2)
      CGContextFillRect(context, rect)
      CGContextStrokeRect(context, rect)
    end

    y = (rect.size.height - @cell.content.icon.size.height) / 2.0
    @cell.content.icon.drawAtPoint(CGPointMake(10, y))

    if @highlighted
      UIColor.whiteColor.setFill
    else
      UIColor.blackColor.setFill
    end
    str_x = 10 + @cell.content.icon.size.width + 10
    str_rect = rect
    str_rect.origin.x = str_x
    str_rect.size.width = rect.size.width - str_x
    @cell.content.title.drawInRect(str_rect, withFont: UIFont.systemFontOfSize(18.0), lineBreakMode: UILineBreakModeTailTruncation)
  end
end
