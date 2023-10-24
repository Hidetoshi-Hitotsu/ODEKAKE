5.times do |n|
  User.seed do |user|
    user.id = n
    user.name = "testname#{n}"
    user.email = "test#{n}@example.com"
    user.password = "password#{n}"
  end
end
