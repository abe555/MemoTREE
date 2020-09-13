class Tag < ApplicationRecord
	has_many :memo_tags
	has_many :word_tags

	validates :tag, presence: true, length: {maximum:99}
end
