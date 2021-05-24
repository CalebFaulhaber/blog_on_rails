class Post < ApplicationRecord

    has_many :comments
    belongs_to :user, optional: true

    validates :title,
        presence: { message: 'Must include title' },
        uniqueness: { case_sensitive: true }

    validates :body,
        presence: { message: 'Must include a message' },
        length: { minimum: 5, message: 'Minimum 5 characters' }

    # # PATHS
    # index  - products_path
    # new    - new_product_path
    # edit   - edit_product_path
    # show   - product_path
    # create - n/a
    # update - n/a
    # destroy - n/a

end



