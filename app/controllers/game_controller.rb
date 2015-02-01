class GameController < ApplicationController

	before_action :logged_in_user
	before_action :current_user
	before_action :set_sign, only: :check_answer  
	before_action :get_random_sign, only: [:beginner, :leap]


	def play
	end


	def leap
		@sign = Sign.order("RANDOM()").first
	end

	def check_answer
		if is_answer_right?(params[:game])
			@current_user.update_attribute(:points, @current_user.points+10)
			flash[:success] = "Good Job! You just won 10 points!"
		else
			flash[:danger] = 'Wrong answer!'
		end
		redirect_to play_beginner_path
	end

	def check_answer_leap

		redirect_to play_leap_path
	end


	private 
	def is_answer_right?(params)
		((params[:char].downcase)==(Sign.find_by(id: params[:id]).symbol))? true: false
	end

	def set_sign 
		@sign = Sign.find_by(id: params[:game][:id])
	end


	def get_random_sign
		@sign = Sign.order("RANDOM()").first
	end

end
