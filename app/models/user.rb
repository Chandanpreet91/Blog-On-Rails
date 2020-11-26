class User < ApplicationRecord
    has_many :comments, dependent: :nullify
    has_many :posts, dependent: :nullify
end
