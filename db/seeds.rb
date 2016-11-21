User.create! name: "admin", email: "toiladuy22@gmail.com",
  password: "123123", password_confirmation: "123123",
  is_admin: true

User.create! name: "Customer", email: "nguyendinhduy2864@gmail.com",
  password: "123123", password_confirmation: "123123"

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create! name: name, email: email, password: password,
    password_confirmation: password
end
