module ApplicationHelper
  def image_for_author author_name
    url = "http://f.cl.ly/items/353h390W2E002I3N1P2R/britt@2x.jpg" if author_name.include? "Brittany"
    url = "http://cl.ly/image/1e0q1G1H1u2O/paul@2x.jpg" if author_name.include? "Paul"
    url
  end
end
