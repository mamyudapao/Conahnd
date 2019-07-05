User.create!(name: "nosiken",
            email: "nosikenab@gmail.com",
            password: "51015101Ab!",
            password_confirmation: "51015101Ab!",
            admin: true
)


99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
