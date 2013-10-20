class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validate do |user|
    user.must_be_from_domain
  end

  def must_be_from_domain
    return unless Preferences.email_limit_to_domain.present?
    errors.add(:email, "must be from #{Preferences.email_limit_to_domain} domain") unless email =~ Regexp.new(Preferences.email_limit_to_domain)
  end

  validates_presence_of :first_name, :last_name

  def roles
    @roles ||= attributes['roles'] ? YAML::load(attributes['roles']) : []
  end

  def roles= value
    raise ArgumentError, 'Argument is not an Array' unless value.is_a?(Array)
    super(value.to_yaml)
    @roles = value
  end

  has_many :bailiwicks
end

