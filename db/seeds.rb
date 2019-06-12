# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
              {
                email: 'test@user.at',
                password: '123456',
                nickName: 'pflanzenboy',
                confirmed_at: Time.now()
              },
              {
                email: 'testine@user.at',
                password: '123456',
                nickName: 'pflanzengirl',
                confirmed_at: Time.now()
              },
              {
                email: 'benjamin.joham@gmail.com',
                password: 'test1234',
                nickName: 'Benni',
                confirmed_at: Time.now()
              }
            ])

Plant.create([
               {
                 realName: 'Rose',
                 nickName: 'Lisa',
                 waterNeed: 1400,
                 waterCurrent: 600,
                 sunNeed: 2.5,
                 place: 'Küche',
                 love: 6,
                 user_id: 1
               },
               {
                 realName: 'Kaktus',
                 nickName: 'Max',
                 waterNeed: 1200,
                 waterCurrent: 600,
                 sunNeed: 2.5,
                 place: 'Schlafzimmer',
                 love: 3,
                 user_id: 1
               },
               {
                 realName: 'Rose',
                 nickName: 'Lisa',
                 waterNeed: 1400,
                 waterCurrent: 600,
                 sunNeed: 2.5,
                 place: 'Küche',
                 love: 6,
                 user_id: 2
               },
               {
                 realName: 'Kaktus',
                 nickName: 'Max',
                 waterNeed: 1200,
                 waterCurrent: 600,
                 sunNeed: 2.5,
                 place: 'Schlafzimmer',
                 love: 3,
                 user_id: 2
               },
               {
                 realName: 'Rose',
                 nickName: 'Lisa',
                 waterNeed: 1400,
                 waterCurrent: 600,
                 sunNeed: 2.5,
                 place: 'Küche',
                 love: 6,
                 user_id: 3
               }
             ])

# Plant.create([
#     {
#         realName: 'sljfslfj',
#         nickName: 'plant1',
#         waterNeed: 1400,
#         waterCurrent: 600,
#         sunNeed: 2.5,
#         place: 'bedroom',
#         love: 6,
#         user_id: 2
#     },
#     {
#         realName: 'sfsf',
#         nickName: 'plant2',
#         waterNeed: 1200,
#         waterCurrent: 600,
#         sunNeed: 2.5,
#         place: 'living room',
#         love: 3,
#         user_id: 1
#     }
# ])
