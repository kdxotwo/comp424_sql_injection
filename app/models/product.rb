class Product < ApplicationRecord
    has_many :orders

    def self.search(search_queries)
        Product.where("name LIKE '%#{search_queries}%'")
    end
end
