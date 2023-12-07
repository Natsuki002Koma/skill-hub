class SkillStatus < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '学習予定' },
    { id: 3, name: '学習中' },
    { id: 4, name: '資格取得済' },
    { id: 5, name: '習得済' },
    { id: 6, name: '休憩中' },
    { id: 7, name: 'その他' }
  ]

 include ActiveHash::Associations
  has_many :skills

  end