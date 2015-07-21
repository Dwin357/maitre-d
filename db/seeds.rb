User.destroy_all
Appearance.destroy_all
Race.destroy_all

u1 = User.create!(username: "user1",
                  password: 1,
                  race_character: 27)

u2 = User.create!(username: "user2",
                  password: 12,
                  race_character: 16)

u3 = User.create!(username: "user3",
                  password: 123,
                  race_character: 32)

u4 = User.create!(username: "user4",
                  password: 1234,
                  race_character: 39)

u5 = User.create!(username: "user5",
                  password: 12345,
                  race_character: 8)

contestants = [u1, u2, u3, u4, u5]

r1 = Race.create!(name: "Megatron",
                  winner: contestants.sample)

r2 = Race.create!(name: "StarScream",
                  winner: contestants.sample)

r3 = Race.create!(name: "DinoBot",
                  winner: contestants.sample)

races = [r1, r2, r3]

races.each do |race|
  contestants.each do |user|
    Appearance.create!(race: race, user: user)
  end
end
