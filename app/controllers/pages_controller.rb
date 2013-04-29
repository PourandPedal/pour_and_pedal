class PagesController < ApplicationController

  expose(:home_image)
  expose(:home_images)

  def index
    home_images.sort!{|i1,i2| i1.position <=> i2.position}
    render layout: 'application'
  end

  def faqs
    @faqs = Faq.all
  end

  def about
    render layout: 'pages'
  end

  def upgrade_browser
    render layout: false
  end

  def directions
  end
end
