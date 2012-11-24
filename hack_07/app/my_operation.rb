# -*- coding: utf-8 -*-

class MyOperation < NSOperation
  def initWithDelegate(aDelegate)
    init
    @delegate = aDelegate
    self
  end

  def main
    10.times do |i|
      NSLog("#{i} sec")
      NSThread.sleepForTimeInterval(1)
      if self.isCancelled
        NSLog('Cancelled')
        break
      end
    end
  end
end
