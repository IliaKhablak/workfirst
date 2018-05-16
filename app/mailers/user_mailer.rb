class UserMailer < ApplicationMailer

	def welcome_email(title,email,name,text)
		@name = name
		@text = text
		@email = email
	    mail(to: 'apella2010@gmail.com', subject: title)
	  end

	 #  def mailTo(id, x)
		# @order = Order.find(id)

		# @x = x
		# print "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#{@x}@@@@@@@@@@@@@@@@@@@"
	 #    mail(to: 'apella2010@gmail.com', subject: "Новый заказ номер #{@order.id}")
	 #  end

	 #  def mailToClient(id)
		# @order = Order.find(id)
	 #    mail(to: 'apella2010@gmail.com', subject: 'Новый заказ')
	 #  end
end
