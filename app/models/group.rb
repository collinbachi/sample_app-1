class Group < ActiveRecord::Base
	belongs_to :user
	has_many :leader_member_relationships, foreign_key: "leader_id", dependent: :destroy
	has_many :members, through: :relationships, source: :leader

	default_scope -> { order('created_at DESC') }
	validates :name, presence: true, uniqueness: true
	validates :user_id, presence: true
	validates :description, presence: true

	 def leader?(user)
    leader_member_relationships.find_by(member_id: user.id)
  end

  def add!(user)
    leader_member_relationships.create!(member_id: user.id)
  end

  def remove!(user)
    leader_member_relationships.find_by(leader_id: user.id).destroy
  end
end
