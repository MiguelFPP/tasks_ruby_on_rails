# == Schema Information
#
# Table name: categories
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Category < ApplicationRecord
  has_many :tasks

  #validations
  validates :name, :description, presence:true
  #validation uniqueness and not case sensitive
  validates :name, uniqueness: { case_sensitive: false}
end
