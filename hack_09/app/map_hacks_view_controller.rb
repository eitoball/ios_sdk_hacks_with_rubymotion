# -*- coding: utf-8 -*-
class MapHacksViewController < UIViewController
  attr_accessor :mapView

  def mapView_
    @mapView
  end

  def setMapView_(mapView)
    @mapView = mapView
  end

  def mapView(mapView, viewForAnnotation: annotation)
    return nil if annotation.isKindOfClass(MKUserLocation.class)

    annotationView = mapView.dequeueReusableAnnotationViewWithIdentifier('Annotationview')
    annotationView = MKPinAnnotationView.alloc.initWithAnnotation(annotation, reuseIdentifier: 'Annotationview') if annotationView.nil?

    annotationView.tap do |av|
      av.canShowCallout = true
      av.animatesDrop = true
    end
  end

  API_KEY = 'ABQIAAAAyt0rtmRh90pLhA10hrJISxTwDowqL9HHKg3JSnSF0sTQmVxJ4RTqGCmKrrG7q5_r6O2v9epSc5QSTA'

  GOOGLE_API_QUERY = 'http://ajax.googleapis.com/ajax/services/search/local?q=%s&v=1.0&key=%s&hl=ja&sll=%.4f,%.4f&sspn=%.6f,%.6f'

  def searchBarSearchButtonClicked(searchBar)
    region = self.mapView.region

    percentEscaped = searchBar.text.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
    url = GOOGLE_API_QUERY % [percentEscaped, API_KEY, region.center.latitude, region.center.longitude, region.span.latitudeDelta, region.span.longitudeDelta]

    request = NSURLRequest.requestWithURL(NSURL.URLWithString(url))
    data = NSURLConnection.sendSynchronousRequest(request, returningResponse: Pointer.new(:object), error: Pointer.new(:object))

    parsed = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingMutableContainers & NSJSONReadingMutableLeaves & NSJSONReadingAllowFragments, error: Pointer.new(:object))

    results = parsed['responseData']['results']

    if results.count > 0
      self.mapView.removeAnnotations(self.mapView.annotations)
      annotations = []
      results.each do |result|
        annotations << MyAnnotation.new.tap do |annotation|
          annotation.title = result['titleNoFormatting']
          annotation.coordinate = [result['lat'].floatValue, result['lng'].floatValue]
        end
      end
      self.mapView.addAnnotations(annotations)
    end
    searchBar.resignFirstResponder
  end

  def viewDidLoad
    super
    self.mapView.showsUserLocation = true
  end
end
