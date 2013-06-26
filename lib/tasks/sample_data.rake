namespace :db do
  desc "Populate users, surveys, questions and answers with fake data"
  task populate: [:users, :surveys]

  task users: :environment do
    20.times do |n|
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name

      User.create!(
          first_name: first_name,
          last_name: last_name,
          email: "#{(first_name+last_name).delete(' ')}#{n+1}@survey-system.com",
          password: "password",
          password_confirmation: "password"
      )
    end
  end

  task surveys: :environment do
    15.times do |s|
      survey = Faker::Internet.domain_name
      (5+rand(1..5)).times do |q|
        words = Faker::Lorem.words(3)
        Question.new(
            {
                "text" => Faker::Lorem.sentence,
                "survey_section_title" => survey,
                "display_type" => "inline",
                "pick" => "one",
                "answers_attributes" => {
                    "0" => {'text' => words.first, "_destroy" => "false"},
                    "1" => {'text' => words[1], "_destroy" => "false"},
                    "2" => {'text' => words.last, "_destroy" => "false"}
                }
            }
        ).save
      end
    end
  end

end