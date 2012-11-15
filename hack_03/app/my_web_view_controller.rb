class MyWebViewController < UIViewController
  def loadView
    super
    self.view = UIWebView.alloc.init.tap do |webView|
      webView.delegate = self
      webView.scalesPageToFit = true
    end
  end

  def viewDidLoad
    super
    req = NSURLRequest.requestWithURL(NSURL.URLWithString('http://www.apple.com/'))
    self.view.loadRequest(req)
  end

  def webView(webView, shouldStartLoadWithRequest: request, navigationType: navigationType)
    if request.respond_to?(:'setValue:forHTTPHeaderField:')
      mutableRequest = request.mutableCopy
      mutableRequest.setValue('userAgent', forHTTPHeaderField: 'User_Agent')
    end
    true
  end
end

