# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  [
    {
      email: 'taro@example.com',
      password: 'password',
      name: '太郎',
      birth_date: Faker::Date.between(from: '1930-01-01', to: Date.today),
      sex: 0,
      avatar: open('./app/assets/images/seeds/man1.png')
    },


    {
      email: 'ichiro@example.com',
      password: 'password',
      name: '一郎',
      birth_date: Faker::Date.between(from: '1930-01-01', to: Date.today),
      sex: 0,
      avatar: open('./app/assets/images/seeds/man2.png')
    },

    {
      email: 'hanako@example.com',
      password: 'password',
      name: '花子',
      birth_date: Faker::Date.between(from: '1930-01-01', to: Date.today),
      sex: 1,
      avatar: open('./app/assets/images/seeds/woman1.png')
    },

    {
      email: 'masako@example.com',
      password: 'password',
      name: '正子',
      birth_date: Faker::Date.between(from: '1930-01-01', to: Date.today),
      sex: 1,
      avatar: open('./app/assets/images/seeds/woman2.png')
    }
  ]
)

Teacher.create!(
  [
    {
      email: 'tanaka@example.com',
      password: 'password',
      name: '田中',
      birth_date: Faker::Date.between(from: '1930-01-01', to: Date.today),
      sex: 0,
      avatar: open('./app/assets/images/seeds/teacher_man1.png')
    },


    {
      email: 'yamada@example.com',
      password: 'password',
      name: '山田',
      birth_date: Faker::Date.between(from: '1930-01-01', to: Date.today),
      sex: 0,
      avatar: open('./app/assets/images/seeds/teacher_man2.png')
    },

    {
      email: 'suzuki@example.com',
      password: 'password',
      name: '鈴木',
      birth_date: Faker::Date.between(from: '1930-01-01', to: Date.today),
      sex: 1,
      avatar: open('./app/assets/images/seeds/teacher_woman1.png')
    },

    {
      email: 'sato@example.com',
      password: 'password',
      name: '佐藤',
      birth_date: Faker::Date.between(from: '1930-01-01', to: Date.today),
      sex: 1,
      avatar: open('./app/assets/images/seeds/teacher_woman2.png')
    }
  ]
)

Admin.find_or_create_by(email: 'admin@example.com') do |admin|
  admin.email = 'admin@example.com'
  admin.password = 'password'
end