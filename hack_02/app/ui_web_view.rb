class UIWebView
  def respondsToSelector(aSelector)
    $stderr.puts("[#{self.class.name}] #{aSelector}")
    #if aSelector == :'scrollViewDidScroll:'
    #  $stderr.puts("[#{self.class.name}] #{aSelector}")
    #end
    super
  end
end
