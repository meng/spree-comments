class Comment < ActiveRecord::Base
  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true
  belongs_to :comment_type

  default_scope :order => 'created_at ASC'

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user
  belongs_to :user
  
  before_save :set_resolved_at_if_resolved
  
  STATUSES = ['comment', 'issue', 'resolved']
  
  def resolved!
    update_attribute(:status, 'resolved')
  end
  
  private
  
  def set_resolved_at_if_resolved
    if status == 'resolved' && resolved_at.blank?
      self.resolved_at = Time.zone.now
    end
  end

end
