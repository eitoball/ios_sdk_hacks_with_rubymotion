# -*- coding: utf-8 -*-

class TaskViewController < UIViewController
  def initWithNibName(nibNameOrNil, bundle: nibBundleOrNil)
    super

    @queue = NSOperationQueue.alloc.init

    self
  end

  def viewDidAppear(animated)
    super

    op = MyOperation.alloc.initWithDelegate(self)

    @queue.addOperation(op)
  end

  def viewWillDisappear(animated)
    super

    ops = @queue.operations
    ops.each do |op|
      op.cancel
    end

    @queue.waitUntilAllOperationsAreFinished
  end
end
