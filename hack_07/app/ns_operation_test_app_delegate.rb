# -*- coding: utf-8 -*-

class NSOperationTestAppDelegate
  attr_accessor :delegate, :navigationController, :window

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    bundle = NSBundle.mainBundle.loadNibNamed('MainWindow', owner: self, options: nil).first

    @window = bundle.window
    @navigationController = bundle.navigationController
    @window.addSubview(@navigationController.view)
    @window.makeKeyAndVisible

    true
  end
end
