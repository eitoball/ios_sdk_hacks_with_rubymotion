# -*- coding: utf-8 -*-
class MapHacksAppDelegate
  attr_accessor :window, :viewController, :delegate

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    bundle = NSBundle.mainBundle.loadNibNamed('MainWindow', owner: self, options: nil).first
    @window = bundle.window
    @viewController = bundle.viewController
    @window.rootViewController = @viewController
    @window.addSubview(@viewController.view)
    @window.makeKeyAndVisible
    true
  end
end
