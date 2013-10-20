class Topic < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :name
  has_many :bailiwicks

  @@role_names = [%w(development), %w(product)]
  def role_names; @@role_names end
  def available_roles; @@role_names.flatten end
end
