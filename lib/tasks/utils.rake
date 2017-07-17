namespace :utils do
  desc "Popular banco de dados"
  task seed: :environment do

    puts "Gerando Contatos (Contacts)..."

    100.times do |i|
      Contact.create( name: Faker::Name.name,
                      email: Faker::Internet.email,
                      kind: Kind.all.sample,
                      rmk: LeroleroGenerator.sentence([1,2,3,4,5].sample))
    end

    puts "Gerando Contatos (Contacts)...[OK]"

    puts "Gerando Telefones de Contatos (Phones)..."

    Contact.all.each do |contact|
      Random.rand(1..5).times do |i|
        Phone.create!(phone: Faker::PhoneNumber.phone_number,
                      contact: contact)
      end
    end

    puts "Gerando Contatos (Phones)...[OK]"

  end
end
