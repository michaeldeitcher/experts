class Bailiwick < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  validates_presence_of :user
  validates_presence_of :topic

  @@affinities = %w(noobie seasoned owner)
  validates_presence_of :affinity
  validates_inclusion_of :affinity, :in => @@affinities

  @@ranks = %w(primary secondary)
  validates_presence_of :rank
  validates_inclusion_of :rank, :in => @@ranks
end
