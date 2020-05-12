Post.destroy_all
NUM_POST = 20
PASSWORD = 'yuvi'

super_user = User.create(
    first_name: 'yuvi',
    last_name: 'goraya',
    email: 'yuvi@goraya.gov',
    password: PASSWORD
)

NUM_POST.times do
    p = Post.create({
        author: Faker::Hacker.noun,
        body: Faker::Hacker.say_something_smart,
        user_id: super_user.id
    })
end

puts Cowsay.say("Generated #{Post.all.count} posts", :frogs)