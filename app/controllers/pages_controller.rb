class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :contacts, :terms_and_conditions, :about]

  def home
  end

  def contacts
  end

  def terms_and_conditions
  end

  def about
  end


end
