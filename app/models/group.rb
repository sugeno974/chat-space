class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  accepts_nested_attributes_for :group_users

  validate :add_error_name_empty

  private

  def add_error_name_empty
    if name.empty?
      errors[:base] << "グループ名を入力してください。"
    end
  end

end
