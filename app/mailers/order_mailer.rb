class OrderMailer < ApplicationMailer
  default from: 'no-reply@ding-dong.fr'

  def order_email_tenant(order,tenant)
    @tenant = tenant
    @order = order
    @url  = 'http://ding-dong-production-herokuapp.com/users/#{@user.id}/orders'
    mail(to: @tenant.email, subject: 'Votre commande est confirmée, bravo pour votre achat !')
  end

  def order_email_agent(properties_array, tenant)
    @tenant = tenant
    properties_array.foreach do |property|
    agent = property.agent
    @url  = 'http://ding-dong-production-herokuapp.com/properties/#{@property.id}'
    mail(to: @agent.email, subject: 'Vous avez une nouvelle visite de prévue pour votre bien!')
  end

end
