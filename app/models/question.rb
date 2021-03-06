# == Schema Information
#
# Table name: questions
#
#  id           :integer          not null, primary key
#  title        :string
#  points       :float
#  content      :text
#  test_file    :text
#  starter_file :text
#  metadata     :jsonb
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  category_id  :integer
#
# Indexes
#
#  index_questions_on_category_id  (category_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#

class Question < ActiveRecord::Base
  # has_many :submissions
  belongs_to :category
end
