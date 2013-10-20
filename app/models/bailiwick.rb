class Bailiwick < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  validates_presence_of :user
  validates_presence_of :topic
  validates_presence_of :role
  validates_inclusion_of :role, in: ->(bailiwick) { bailiwick.topic ? bailiwick.topic.available_roles : []}

  scope :with_role, lambda {|role| where(:role => role)}
  scope :with_user, lambda {|user| where(:user => user)}

  @@affinities = %w(noobie seasoned owner)
  validates_presence_of :affinity
  validates_inclusion_of :affinity, :in => @@affinities

  @@ranks = %w(primary secondary)
  validates_presence_of :rank
  validates_inclusion_of :rank, :in => @@ranks

  def self.affinities; @@affinities end
  def self.ranks; @@ranks end
end
