class Conversation < ApplicationRecord
    belongs_to :match
    has_many :messages, dependent: :destroy
    has_many :user_conversations, dependent: :destroy
    has_many :users, through: :user_conversations
end
