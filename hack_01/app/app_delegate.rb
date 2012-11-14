class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWebView.alloc.initWithFrame(CGRectZero)
    dumpSubview(@window)
    true
  end

  def dumpSubview(view)
    NSLog(view.class.name)
    view.subviews.each do |v|
      dumpSubview(v)
    end
  end
end
