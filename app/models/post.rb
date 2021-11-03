class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :clickbait

    def clickbait
        if title == "True Facts"
            errors.add(:title, "Sorry not enough fake news")
        end
    end
end
