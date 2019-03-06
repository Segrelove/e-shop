class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_user_id, except: [:show]
  after_create :order_send


  def order_send
    OrderMailer.order_email_tenant(self,self.tenant).deliver_now
    OrderMailer.order_email_agent(self.properties,self.tenant).deliver_now
  end

  def authenticate_user_id
    unless current_user.id == params[:id].to_i
      redirect_to root_path
    end
  end
end
