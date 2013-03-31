class PagesController < ApplicationController

  expose(:faqs) { Faq.all }

  def index
  end

  def faqs
  end

  def about
  end
end
