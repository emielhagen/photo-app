puts "============================================="
puts "Deleting all data"
puts "============================================="

puts "#{Album.count} Albums destroyed, #{Photo.count} Photos destroyed"

Album.delete_all
puts "============================================="

15.times do
  Album.create(name: Faker::Address.state)
end

Album.all.each do |album|
  a = Photo.new(
    album: album,
    location: album.name,
    cam_type: 'Nikon',
    exposure: '1/1000',
    iso_speed: '15',
    foc_length: '105'
  )
  a.image.attach(
    io: File.open(File.join(Rails.root, 'app/assets/images/mountain.jpeg')),
    filename: 'file.jpeg'
  )
  a.save!
end

puts "#{Album.count} albums created and #{Photo.count} photos created"
puts "============================================="


