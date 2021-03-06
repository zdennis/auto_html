require File.dirname(__FILE__) + '/../unit_test_helper'

class LinkTest < Test::Unit::TestCase

  def test_transform
    result = auto_html("http://vukajlija.com") { link }
    assert_equal '<a href="http://vukajlija.com">http://vukajlija.com</a>', result
  end
  
  def test_transform_complex_url
    result = auto_html("http://www.google.com/#q=nikola+tesla&ct=tesla09&oi=ddle&fp=Xmf0jJ9P_V0") { link }
    assert_equal '<a href="http://www.google.com/#q=nikola+tesla&ct=tesla09&oi=ddle&fp=Xmf0jJ9P_V0">http://www.google.com/#q=nikola+tesla&ct=tesla09&oi=ddle&fp=Xmf0jJ9P_V0</a>', result
  end
  
  def test_transform_with_options
    result = auto_html("http://rors.org") { link :rel => "nofollow", :target => "_blank" }
    assert_equal '<a href="http://rors.org" rel="nofollow" target="_blank">http://rors.org</a>', result
  end

end