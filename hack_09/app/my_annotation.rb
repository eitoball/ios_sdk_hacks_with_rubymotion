# -*- coding: utf-8 -*-

class MyAnnotation
  # XXX: To confirm MKAnnotation protocol, you need to define these methods, not by attr_reader
  def coordinate; @coordinate; end
  def title; @title; end
  def subtitle; @subtitle; end

  attr_writer :coordinate, :title, :subtitle
end
