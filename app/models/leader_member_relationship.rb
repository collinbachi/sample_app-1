class LeaderMemberRelationship < ActiveRecord::Base
	belongs_to :member, class_name: "User"
 	belongs_to :leader, class_name: "Group"
 	validates :member_id, presence: true
    validates :leader_id, presence: true
end
