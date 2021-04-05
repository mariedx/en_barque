class MessageMailer < ApplicationMailer

  def contact(message)
    @body = message.body
    @email = message.email
    @phone_number = message.phone_number
    @name = message.name
    mail(to: 'liana.mikael@enbarque-orientation.com', subject: 'Nouveau message sur le site !')
  end 

end
