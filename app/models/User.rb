class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :first_name, type: String
end
