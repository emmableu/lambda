# == Schema Information
#
# Table name: options
#
#  id            :integer          not null, primary key
#  quiz_id       :integer
#  optionbody_en :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  order         :integer
#  comment_en    :text
#  optionbody_zh :text
#  comment_zh    :text
#
# Indexes
#
#  index_options_on_quiz_id  (quiz_id)
#
# Foreign Keys
#
#  fk_rails_...  (quiz_id => quizzes.id)
#

require 'rails_helper'

RSpec.describe Option, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
