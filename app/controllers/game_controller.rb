class GameController < ApplicationController

	before_action :logged_in_user
	before_action :current_user
	before_action :set_sign, only: :check_answer  
	before_action :get_random_sign, only: [:beginner, :leap]
	before_action :set_control_filters, only: [:leap, :check_answer_leap]


	respond_to :html, :js, :json

	protect_from_forgery except: :check_answer_leap

	ALLOWED_LETTERS = ['w', 'y',  'i',  'v', 'u']

	def play
	end


	def leap
		@sign = Sign.order("RANDOM()").reject do |i|
			!ALLOWED_LETTERS.include? i.symbol
		end.first
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
		respond_to do |format|
			if is_answer_right?(params[:game])
				@current_user.update_attribute(:points, @current_user.points+30)
				# puts "EH TRUE PORRRAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
				# flash[:success] = "Good Job! You just won 10 points!"
				format.json {render json: '', status: :created}
				format.html {redirect_to play_leap_path}
				
			else
				# puts "EH FALSE PORRRAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
				# flash[:danger] = 'Wrong answer!'
				format.json { render json: '', status: :unprocessable_entity }
				format.html {redirect_to play_leap_path}
				
			end



		end

		

	end


	private 

	def set_control_filters 

		headers['Access-Control-Allow-Origin'] = '*'
		headers['Access-Control-Allow-Methods'] = 'POST, PUT, DELETE, GET, OPTIONS'
		headers['Access-Control-Request-Method'] = '*'
		headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept, Authorization'

	end

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
