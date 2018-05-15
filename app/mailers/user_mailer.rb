class UserMailer < ApplicationMailer

	def welcome_email()
	    mail(to: 'apella2010@gmail.com', subject: 'Welcome to My Awesome Site')
	  end
end
