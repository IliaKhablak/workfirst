class UserMailer < ApplicationMailer

	def welcome_email(title,email,name,text)
		@name = name
		@text = text
	    mail(to: 'apella2010@gmail.com', subject: title)
	  end
end
