class UserMailer < ApplicationMailer

	def welcome_email(title,email,name,text)
		@name = name
		@text = text
		@email = email
	    mail(to: 'apella2010@gmail.com', subject: title)
	  end

	  def mailTo(id)
		@order = Order.find(id)
		@bla = []
		@order.product_id.each do |key,value|
			b = Product.find(key)
			c = [b,value]
			@bla << c
		end		
	    mail(to: 'apella2010@gmail.com', subject: "Новый заказ номер #{@order.id}")
	  end

	  def mailToClient(id)
		@order = Order.find(id)
		@bla = []
		@order.product_id.each do |key,value|
			b = Product.find(key)
			c = [b,value]
			@bla << c
		end		
	    mail(to: @order.user_email, subject: "Ваш заказ на сайте Ognetushiteli.me принят.")
	  end

	 #  def mailToClient(id)
		# @order = Order.find(id)
	 #    mail(to: 'apella2010@gmail.com', subject: 'Новый заказ')
	 #  end
end
