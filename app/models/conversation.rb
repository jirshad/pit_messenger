class Conversation < ActiveRecord::Base
 belongs_to :sender, :foreign_key => :a_id, class_name: ‘User’
 belongs_to :recipient, :foreign_key => :b_id, class_name: ‘User’

has_many :messages, dependent: :destroy

validates_uniqueness_of :a_id, :scope => :b_id

scope :between, -> (a_id,b_id) do
 where(“(conversations.a_id = ? AND conversations.b_id =?) OR (conversations.a_id = ? AND conversations.b_id =?)”, a_id,b_id, b_id, a_id)
 end

end
