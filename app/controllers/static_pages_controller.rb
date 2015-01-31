class StaticPagesController < ApplicationController

	before_action :logged_in_user, only: [:play]

  def home
  end

  def help
  end

  def about
  end

  def play

  end
end
