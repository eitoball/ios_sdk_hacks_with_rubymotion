class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    root = RootViewController.alloc.initWithStyle(UITableViewStylePlain)
    @navigationController = UINavigationController.alloc.initWithRootViewController(root)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.addSubview(@navigationController.view)
    @window.makeKeyAndVisible
    true
  end
end
