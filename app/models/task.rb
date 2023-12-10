# == Schema Information
#
# Table name: tasks
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :text
#  due_date    :date
#  category_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Task < ApplicationRecord
  belongs_to :category

  #validations
  validates :name, :description, :due_date, :category_id, presence:true
  #validation uniqueness and not case sensitive
  validates :name, uniqueness: { case_sensitive: false}
  #validation personilized
  validate :due_date_validate


  def due_date_validate

    #verify if due_date is blank
    return if due_date.blank?
    #verify if due_date is in the past
    return if due_date > Date.today

    #add error to the model
    errors.add :due_date, I18n.t('tasks.errors.due_date')
  end
end
