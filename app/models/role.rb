# == Schema Information
#
# Table name: roles
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

# CanCan uses roles to manage authorization
class Role < ActiveRecord::Base
  attr_accessible :name
  has_many :user_roles
  has_many :users, :through => :user_roles

  validates :name, :presence => true, :uniqueness => true

  def self.super_admin
    @super_admin ||= Role.create(:name => SUPER_ADMIN)
  end

  def self.admin
    @admin ||= Role.create(:name => ADMIN)
  end

  def self.stocker
    @stocker ||= Role.create(:name => STOCKER)
  end

end