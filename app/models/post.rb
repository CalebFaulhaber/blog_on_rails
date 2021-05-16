class Post < ApplicationRecord

    validates :title,
        presence: { message: 'Must include title' },
        uniqueness: { case_sensitive: true }

    validates :body,
        presence: { message: 'Must include a message' },
        length: { minimum: 50, message: 'Minimum 50 characters' }

end



