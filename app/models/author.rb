class Author < ActiveRecord::Base
	has_secure_password
	validates :name, presence: true, uniqueness: true
	has_many :thoughts, dependent: :destroy
end