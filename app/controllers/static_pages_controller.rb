class StaticPagesController < ApplicationController

	before_action :logged_in_user, only: [:play]

	def home
		if logged_in?
			@user = current_user
			@top_users = User.order('points DESC')

		end
	end

	def help
	end

	def about
	end

	def play

	end
end
