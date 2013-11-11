namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    5.times do |n|
      puts "[DEBUG] creating user #{n+1} of 10"
      name = Faker::Name.name
      email = "user-#{n+1}@example.com"
      password = "password"
      User.create!( name: name,
                    email: email,
                    password: password,
                    password_confirmation: password)
    end

    User.all.each do |user|
      puts "[DEBUG] uploading thumbnails for user #{user.id} of #{User.last.id}"
      3.times do |n|
        thumbnail = File.open(Dir.glob(File.join(Rails.root, 'faker', '*')).sample)
        title = ["Community Park on TNB Reserve Land","Backlane Project","Bicycle Map Project – Cycling Kuala Lumpur"].sample
        description = ["Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam pharetra dapibus erat at hendrerit. Phasellus et nisl a est laoreet lacinia vitae sollicitudin enim. Mauris congue turpis in orci sodales lacinia. Curabitur dictum congue dolor, ut sodales justo commodo in. Vivamus vestibulum vel lacus eu posuere. Aliquam ac eros eros. Pellentesque condimentum purus odio, ac varius mauris aliquam sit amet. In hac habitasse platea dictumst. Ut vitae adipiscing arcu. Pellentesque gravida vulputate egestas. Donec metus libero, auctor ac ornare eu, cursus eu sem. Sed a libero quis lacus porttitor tristique. Donec malesuada, justo sit amet luctus aliquam, augue lorem condimentum neque, pellentesque condimentum nisi quam ut urna. Proin eu nunc diam. Aliquam tortor enim, ornare et turpis vitae, condimentum placerat lectus. Sed sed quam vel leo venenatis convallis eget ac orci.","Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam pharetra dapibus erat at hendrerit. Phasellus et nisl a est laoreet lacinia vitae sollicitudin enim. Mauris congue turpis in orci sodales lacinia. Curabitur dictum congue dolor, ut sodales justo commodo in. Vivamus vestibulum vel lacus eu posuere. Aliquam ac eros eros. Pellentesque condimentum purus odio, ac varius mauris aliquam sit amet. In hac habitasse platea dictumst. Ut vitae adipiscing arcu. Pellentesque gravida vulputate egestas. Donec metus libero, auctor ac ornare eu, cursus eu sem. Sed a libero quis lacus porttitor tristique. Donec malesuada, justo sit amet luctus aliquam, augue lorem condimentum neque, pellentesque condimentum nisi quam ut urna. Proin eu nunc diam. Aliquam tortor enim, ornare et turpis vitae, condimentum placerat lectus. Sed sed quam vel leo venenatis convallis eget ac orci.

Praesent varius tortor nec libero semper, id sagittis nisi ornare. Nullam pellentesque eros congue dignissim imperdiet. Pellentesque ac enim eleifend, auctor arcu suscipit, pharetra enim. Donec congue mauris vel turpis egestas, at hendrerit neque tincidunt. Suspendisse potenti. Etiam porttitor vehicula volutpat. Integer sollicitudin, ipsum eget molestie laoreet, massa erat vestibulum nunc, ut scelerisque ligula enim eu augue. Quisque libero est, vulputate ut euismod ac, mattis sit amet tortor. Cras gravida metus ut egestas pulvinar.

Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque vehicula elit sapien, a dapibus arcu gravida quis. Nunc viverra tellus vel tellus pretium fermentum. Mauris scelerisque libero et eros tincidunt lacinia. Aenean consectetur porttitor metus at malesuada. Suspendisse non vehicula arcu, non vulputate mauris. Morbi varius, ante vel mattis congue, urna est varius quam, vitae cursus dolor dui tempor quam. Fusce nec neque rutrum, fringilla dolor vel, faucibus nisi. Mauris pharetra, eros sed semper fringilla, arcu ante feugiat nulla, sed sodales elit odio nec lacus. Nulla facilisi. Curabitur eleifend nisl nec porta faucibus. Maecenas eu diam non elit tempor dictum."].sample
        user.projects.create!(thumbnail: thumbnail, title: title, description: description)
      end
    end
  end
end