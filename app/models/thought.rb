class Thought < ActiveRecord::Base
	include ActionView::Helpers::DateHelper

	belongs_to :author
	default_scope { order('created_at desc')}
	scope :today, lambda {where("updated_at > ? ", Time.now.beginning_of_day)}

	def time_ago
		time_ago_in_words(updated_at)
	end
end
