class PagesController < ApplicationController

  def index
  end

  def faqs
    @faqs = Faq.all
  end

  def about
  end

  def upgrade_browser
    render layout: false
  end
end
