class StaticPagesController < ApplicationController

	before_action :logged_in_user, only: [:play]

	def home
		if logged_in?
			@user = current_user
			@users = User.paginate(:page => params[:page], :per_page => 5).order('points DESC')

		end
	end

	def help
	end

	def about
	end

	def play

	end
end
