class Product < ApplicationRecord
    has_many :orders

    def self.search(search_queries)
        #insecure way
        result = ActiveRecord::Base.connection.exec_query("SELECT name as name, price as price, quantity as quantity FROM products WHERE name LIKE '%#{search_queries}%'").to_a
        result.map{|hash| hash.transform_keys(&:to_sym) }

        #secure way, it will escape and sanitize the queries or throw errors
        # Product.where("name LIKE ?", "%#{search_queries}%")
    end
end
