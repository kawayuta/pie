class Collection < ApplicationRecord

  
  records_with_operator_on :create, :update

    validates :collection_name,
    presence: true
end
