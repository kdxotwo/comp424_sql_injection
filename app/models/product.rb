class Product < ApplicationRecord
    has_many :orders

    def self.search(search_queries)
        #insecure way
        Product.where("name LIKE '%#{search_queries}%'")

        #secure way, it will escape and sanitize the queries.
        # it'll throw away an error
        # Product.where("name LIKE '%?%'", search_queries)
    end
end
