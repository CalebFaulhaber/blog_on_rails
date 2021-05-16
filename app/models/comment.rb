class Comment < ApplicationRecord

    belongs_to :post

    validates :body, 
    presence: { message: 'Please enter a message' },
    length: { minimum: 10, message: 'Minimum 10 characters' }

    # # PATHS
    # index  - products_path
    # new    - new_product_path
    # edit   - edit_product_path
    # show   - product_path
    # create - n/a
    # update - n/a
    # destroy - n/a

end
