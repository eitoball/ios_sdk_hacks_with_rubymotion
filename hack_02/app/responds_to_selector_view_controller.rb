class RespondsToSelectororViewController < UIViewController
  def loadView
    self.view = webView
  end

  def viewDidLoad
    super
    req = NSURLRequest.requestWithURL(NSURL.URLWithString('http://www.apple.com'))
    webView.loadRequest(req)
  end

  def webView
    if ! defined?(@webView)
      @webView = UIWebView.alloc.init
      @webView.scalesPageToFit = true
    end
    @webView
  end
end
