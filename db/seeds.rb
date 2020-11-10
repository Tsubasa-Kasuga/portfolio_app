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
      birth_date: Faker::Date.between(from: '1950-01-01', to: '1995-01-01'),
      sex: 0,
      avatar: open('./app/assets/images/seeds/man1.png')
    },


    {
      email: 'ichiro@example.com',
      password: 'password',
      name: '一郎',
      birth_date: Faker::Date.between(from: '1950-01-01', to: '1995-01-01'),
      sex: 0,
      avatar: open('./app/assets/images/seeds/man2.png')
    },

    {
      email: 'hanako@example.com',
      password: 'password',
      name: '花子',
      birth_date: Faker::Date.between(from: '1950-01-01', to: '1995-01-01'),
      sex: 1,
      avatar: open('./app/assets/images/seeds/woman1.png')
    },

    {
      email: 'masako@example.com',
      password: 'password',
      name: '正子',
      birth_date: Faker::Date.between(from: '1950-01-01', to: '1995-01-01'),
      sex: 1,
      avatar: open('./app/assets/images/seeds/woman2.png')
    },

    { 
      id: 99,
      email: 'guest@example.com',
      password: SecureRandom.urlsafe_base64,
      name: 'ゲスト会員',
      birth_date: "1990-10-1",
      sex: 1
    }
  ]
)

Teacher.create!(
  [
    {
      email: 'tanaka@example.com',
      password: 'password',
      name: '田中',
      birth_date: Faker::Date.between(from: '1950-01-01', to: '1995-01-01'),
      sex: 0,
      avatar: open('./app/assets/images/seeds/teacher_man1.png')
    },


    {
      email: 'yamada@example.com',
      password: 'password',
      name: '山田',
      birth_date: Faker::Date.between(from: '1950-01-01', to: '1995-01-01'),
      sex: 0,
      avatar: open('./app/assets/images/seeds/teacher_man2.png')
    },

    {
      email: 'suzuki@example.com',
      password: 'password',
      name: '鈴木',
      birth_date: Faker::Date.between(from: '1950-01-01', to: '1995-01-01'),
      sex: 1,
      avatar: open('./app/assets/images/seeds/teacher_woman1.png')
    },

    {
      email: 'sato@example.com',
      password: 'password',
      name: '佐藤',
      birth_date: Faker::Date.between(from: '1950-01-01', to: '1995-01-01'),
      sex: 1,
      avatar: open('./app/assets/images/seeds/teacher_woman2.png')
    },

    {
      id: 99,
      email: 'guest_teacher@example.com',
      password: SecureRandom.urlsafe_base64,
      name: 'ゲスト講師',
      birth_date: Faker::Date.between(from: '1950-01-01', to: '1995-01-01'),
      sex: 1
    }
  ]
)

Lesson.create!(
  [
    {
      title: 'クラシックピアノレッスン',
      description: 'クラシック専門のピアノレッスンです。レベルに合わせた選曲をさせていただきます。もしご希望の弾きたい曲がございましたら、そちらの曲でもレッスン可能です。',
      time: 1,
      price: 7,
      frequency: 2,
      teacher_id: 99,
      approval: 1,
      lessonImage: open('./app/assets/images/seeds/lesson1.jpg')
    },

    {
      title: 'ショパン入門',
      description: 'ショパンの曲弾いてみませんか？レベルに合わせた選曲をさせていただきます。（対象は楽譜の読み方は分かる方になります。）',
      time: 1,
      price: 7,
      frequency: 2,
      teacher_id: 1,
      approval: 1
    },

    {
      title: 'バッハ入門',
      description: 'バッハの曲弾いてみませんか？レベルに合わせた選曲をさせていただきます。（対象は楽譜の読み方は分かる方になります。）',
      time: 1,
      price: 7,
      frequency: 2,
      teacher_id: 1,
      approval: 1
    },

    {
      title: 'ベートーヴェン入門',
      description: 'ベートーヴェンの曲弾いてみませんか？レベルに合わせた選曲をさせていただきます。（対象は楽譜の読み方は分かる方になります。）',
      time: 1,
      price: 2,
      frequency: 0,
      teacher_id: 1,
      approval: 1
    },

    {
      title: 'モーツァルト入門',
      description: 'モーツァルトの曲弾いてみませんか？レベルに合わせた選曲をさせていただきます。（対象は楽譜の読み方は分かる方になります。）',
      time: 1,
      price: 7,
      frequency: 2,
      teacher_id: 1,
      approval: 1
    },

    {
      title: '耳コピができるようになるレッスン',
      description: '絶対音感がなくても大丈夫です。練習すれば誰でも耳コピはできるようになります。（対象は楽譜の読み方は分かる方になります。）',
      time: 2,
      price: 5,
      frequency: 2,
      teacher_id: 2,
      approval: 1
    },

    {
      title: '初めてのジャズピアノ',
      description: 'ジャズピアノ始めませんか？簡単なフレーズから始めますので、コードがわからなくても大丈夫です！（対象は楽譜の読み方は分かる方になります。）',
      time: 2,
      price: 8,
      frequency: 2,
      teacher_id: 3,
      approval: 1
    },

    {
      title: 'ピアニストによるハノンの正しい練習法',
      description: 'ハノン練習してますか？正しい練習法を身に付けることが上達への近道です。（ハノンの楽譜をお持ちの方が対象です。出版社は問いません。）',
      time: 3,
      price: 5,
      frequency: 0,
      teacher_id: 99,
      approval: 0
    }
  ]
)

Attendance.create!(
  [
    {
      user_id: 99,
      lesson_id: 1,
      termination: 0,
      deleted: 0
    },
    {
      user_id: 1,
      lesson_id: 1,
      termination: 0,
      deleted: 0
    }
  ]
)

Admin.find_or_create_by(email: 'admin@example.com') do |admin|
  admin.email = 'admin@example.com'
  admin.password = 'password'
end