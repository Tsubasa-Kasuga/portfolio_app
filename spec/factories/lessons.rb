FactoryBot.define do
  factory :lesson do
    title {"レッスンタイトル"}
    description {"レッスン説明ああああああああああいいいいいいいいいいううううううううううええええええええええおおおおおおおおおお"}
    price {3}
    time {3}
    frequency {0}
    teacher
  end

  factory :sysLesson1, class: Lesson  do
    title {"システムテストレッスン１タイトル"}
    description {"システムテストレッスン１レッスン説明ああああああああああいいいいいいいいいいううううううううううええええええええええおおおおおおおおおお"}
    price {3}
    time {3}
    frequency {0}
    teacher
  end

  factory :sysLesson2, class: Lesson  do
    title {"システムテストレッスン2タイトル"}
    description {"システムテストレッスン2レッスン説明ああああああああああいいいいいいいいいいううううううううううええええええええええおおおおおおおおおお"}
    price {3}
    time {3}
    frequency {0}
    teacher
  end

end
