class Order < ApplicationRecord
  has_many :join_table_order_properties
  has_many :properties, through: :join_table_order_properties
  after_create :order_send


  belongs_to :tenant, class_name: "User"


  private
  def order_send
    OrderMailer.order_email_tenant(self,self.tenant).deliver_now
    puts self.properties.to_s
    OrderMailer.order_email_agent(self.properties,self.tenant).deliver_now
  end
end
