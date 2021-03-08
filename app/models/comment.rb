class Comment < ApplicationRecord
  include ActionView::RecordIdentifier

  belongs_to :post
  validates :body, presence: true

  after_create_commit do
    broadcast_append_to [post, :comments], target: "#{dom_id(post)}_comments"
  end

  after_destroy_commit do
    broadcast_remove_to self
    broadcast_action_to self, action: :remove, target: "#{dom_id(self)}_with_comments"
  end
end
