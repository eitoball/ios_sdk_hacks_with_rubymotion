# -*- coding: utf-8 -*-

class MyViewController < UIViewController
  def label
    @label
  end

  def label=(label_)
    @label = label_
  end

  def viewDidLoad
    self.label = UILabel.alloc.initWithFrame([[10, 60], [300, 80]]).tap do |l|
      l.backgroundColor = UIColor.lightGrayColor
      l.text = '...'
      l.font = UIFont.boldSystemFontOfSize(18)
      l.textColor = UIColor.darkGrayColor
      l.textAlignment = UITextAlignmentCenter
    end
    view.addSubview(self.label)

    @buffer = NSMutableData.new
    @socket = AsyncSocket.alloc.initWithDelegate(self)
    self.label.text = 'Connecting...'
    if @socket.connectToHost('www.yahoo.com', onPort: 80, error: nil)
      @socket.writeData("GET / HTTP/1.0\r\nHost: www.yahoo.com\r\n\r\n".to_data, withTimeout: -1.0, tag: 0)
      @socket.readDataWithTimeout(-1.0, tag: 0)
    else
      self.label.text = 'Oops...'
    end
  end

  def onSocket(sender, didConnectToHost: host, port: port)
    self.label.text = 'Connected!'
    @socket.readDataWithTimeout(-1.0, tag: 0)
  end

  def onSocketDidDisconnect(sender)
    self.label.text = 'Disconnected...'
  end

  def onSocket(sender, didReadData: data, withTag: tag)
    self.label.text = 'Reading data...'
    @buffer.appendData(data)
  end
end
