class PagesController < ApplicationController

  def index
  end

  def faqs
    @faqs = Faq.all
  end

  def about
  end
end
