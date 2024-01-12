require 'rails_helper'

RSpec.describe Skill, type: :model do
  before do
    user = FactoryBot.create(:user)
    @skill = FactoryBot.build(:skill, user_id: user.id)
  end
  describe 'スキル新規作成' do
    context '新規作成できる場合' do
      it 'すべての項目に正しく入力すれば新規作成できる' do
        expect(@skill).to be_valid
      end
    end
    context '新規作成できない場合' do
      it 'skill_nameが空では作成できない' do
        @skill.skill_name = ''
        @skill.valid?
        expect(@skill.errors.full_messages).to include("Skill name can't be blank")
      end
      it 'skill_status_idが空では作成できない' do
        @skill.skill_status_id = ''
        @skill.valid?
        expect(@skill.errors.full_messages).to include("Skill status can't be blank")
      end
      it 'skill_status_idが「---」では作成できない' do
        @skill.skill_status_id = '1'
        @skill.valid?
        expect(@skill.errors.full_messages).to include("Skill status can't be blank")
      end
      it 'userと紐づいていなければ作成できない' do
        @skill.user = nil
        @skill.valid?
        expect(@skill.errors.full_messages).to include('User must exist')
      end
      it 'skill_levelが0～5以外では作成できない' do
        @skill.skill_level = '6'
        @skill.valid?
        expect(@skill.errors.full_messages).to include('Skill level must be less than or equal to 5')
      end
    end
  end
end
