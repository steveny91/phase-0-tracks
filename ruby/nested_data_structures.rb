mall = {
    stores: {
        pretty_name: 'Stores',
        info: {
            total_stores: 12,
            stores_open: 10
        },
        name: {
          "Clothing" => "Macy's",
          "Jewelers" => "Kays",
          "Sportware" => "Foot locker",
          "Electronics" => "Gamespot",
        },
        specs: [
            "Clothing", 
            "Jewelers",
            "Sportware",
            "Electronics"
        ]
    },
    restaurants: {
        pretty_name: 'Restaurants',
        info: {
            total_restaurants: 6,
            restaurants_open: 5 
        },
        name: {
          "Italian" => "Sbarro",
          "Japanese" => "Ahi Sushi",
          "Chinese" => "Panda Express",
          "Burgers" => "Wendy's",
        },
        specs: [
            "Italian", 
            "Japanese",
            "Chinese",
            "Burgers"

        ]
    },
    stands: {
        pretty_name: 'Stands',
        info: {
            total_stands: 10,
            stands_open: 5
        },
        name: {
          "Beauty products" => "Whatever works",
          "Hair curling" => "Ok curls",
          "Massage" => "Massage now",
          "Toys" => "Gadget",
        },
        specs: [
            "Beauty products",
            "Hair curling",
            "Massage",
            "Toys"
        ]
    }
}

p mall[:stores][:name]
p mall[:stands][:name]

p mall[:stores][:specs].reverse
p mall[:stores][:name].each {|cate, name| puts name}
p mall[:restaurants][:name]
p mall[:restaurants][:specs]
mall[:restaurants][:specs].each {|cat| puts cat.downcase}
mall[:stands][:specs].each {|cat| puts cat.upcase}
