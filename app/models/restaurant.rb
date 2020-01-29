class Restaurant < ActiveRecord::Base
  has_many :rating_n_reviews
end
