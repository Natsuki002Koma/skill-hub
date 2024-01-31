class Time < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '9:00～' },
    { id: 3, name: '10:00～' },
    { id: 4, name: '11:00～' },
    { id: 5, name: '12:00～' },
    { id: 6, name: '13:00～' },
    { id: 7, name: '14:00～' },
    { id: 8, name: '15:00～' },
    { id: 9, name: '16:00～' },
    { id: 10, name: '17:00～' }
  ]

 include ActiveHash::Associations
  has_many :schedules

  end
