class JoinTableOrderProperty < ApplicationRecord
  belongs_to :property
  belongs_to :order
end
