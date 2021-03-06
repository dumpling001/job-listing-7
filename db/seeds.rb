# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "这个seeds文件可以自动建立一个admin账号，并且创建20个public jobs,以及20各hidden jobs"

create_account = User.create([email: 'example@gmail.com', password:'123456', password_confirmation: '123456', is_admin: 'true'])
puts "Admin account created."

Workplace.delete_all
puts "Workplace delete_all."
Workplace.create(name: "北京")
Workplace.create(name: "深圳")
Workplace.create(name: "上海")
Workplace.create(name: "杭州")
Workplace.create(name: "广州")
Workplace.create(name: "成都")
Workplace.create(name: "南京")
Workplace.create(name: "西安")
puts "Workplace created."

Job.delete_all
puts "Job delete_all."

@user = User.find_by(:email => "example@gmail.com")

create_job = for i in 1..20 do
Job.create!([title: "Job no.#{i}", description: "这是用seeds文件建立的第 #{i} 个公开的工作", :user => @user, wage_upper_bound: rand(20..50)*1000, wage_lower_bound: rand(8..19)*1000, is_hidden: "false", workplace_id: rand(1..4)])
end
create_job = for i in 1..20 do
Job.create!([title: "Job no.#{i}", description: "这是用seeds文件建立的第 #{i} 个隐藏的工作", :user => @user, wage_upper_bound: rand(20..50)*1000, wage_lower_bound: rand(5..15)*1000, is_hidden: "true", workplace_id: rand(1..4)])
end
puts "20 Public/Hidden jobs created."
