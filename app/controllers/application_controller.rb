# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  filter_parameter_logging :password

  helper_method :current_user


  private

	def current_user_session
  		return @current_user_session if defined?(@current_user_session)
  		@current_user_session = UserSession.find
	end



	def current_user
  		return @current_user if defined?(@current_user)
  		@current_user = current_user_session && current_user_session.record
	end

   before_filter :set_cache_buster

		def set_cache_buster
    			response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    			response.headers["Pragma"] = "no-cache"
    			response.headers["Expires"] = "Fri, 01 Jan 2020 00:00:00 GMT"
		end




		before_filter :require_login

		private

		def require_login
    			unless current_user
      			redirect_to :controller=>"user_sessions",:action=>"new"
    			end
 	 	end

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
