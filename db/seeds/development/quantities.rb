quantities = [
    [
        1, '1'
    ],
    [
        2, '100'
    ],
    [
        1, '1'
    ],
    [
        3, '0.5'
    ],
    [
        4, '18.0'
    ],
    [
        5, '2'
    ],
    [
        4, '9'
    ],
    [
        5, '4'
    ],
    [
        1, '1'
    ],
    [
        2, '100'
    ],
    [
        1, '1'
    ],
    [
        3, '0.5'
    ],
    [
        4, '18.0'
    ],
    [
        5, '2'
    ],
    [
        4, '9'
    ],
    [
        5, '4'
    ],
    [
        1, '1'
    ],
    [
        2, '100'
    ],
    [
        1, '1'
    ],
    [
        3, '0.5'
    ],
    [
        4, '18.0'
    ],
    [
        5, '2'
    ],
    [
        4, '9'
    ],
    [
        5, '4'
    ],
    [
        1, '1'
    ],
    [
        2, '100'
    ],
    [
        1, '1'
    ],
    [
        3, '0.5'
    ],
    [
        4, '18.0'
    ],
    [
        5, '2'
    ],
    [
        4, '9'
    ],
    [
        5, '4'
    ],
    [
        1, '1'
    ],
    [
        2, '100'
    ],
    [
        1, '1'
    ],
    [
        3, '0.5'
    ],
    [
        4, '18.0'
    ],
    [
        5, '2'
    ],
    [
        4, '9'
    ],
    [
        5, '4'
    ],
    [
        1, '1'
    ],
    [
        2, '100'
    ],
    [
        1, '1'
    ],
    [
        3, '0.5'
    ],
    [
        4, '18.0'
    ],
    [
        5, '2'
    ],
    [
        4, '9'
    ],
    [
        5, '4'
    ],
    [
        1, '1'
    ],
    [
        2, '100'
    ],
    [
        1, '1'
    ],
    [
        3, '0.5'
    ],
    [
        4, '18.0'
    ],
    [
        5, '2'
    ],
    [
        4, '9'
    ],
    [
        5, '4'
    ],
    [
        1, '1'
    ],
    [
        2, '100'
    ],
    [
        1, '1'
    ],
    [
        3, '0.5'
    ],
    [
        4, '18.0'
    ],
    [
        5, '2'
    ],
    [
        4, '9'
    ],
    [
        5, '4'
    ],
    [
        1, '1'
    ],
    [
        2, '100'
    ],
    [
        1, '1'
    ],
    [
        3, '0.5'
    ],
    [
        4, '18.0'
    ],
    [
        5, '2'
    ],
    [
        4, '9'
    ],
    [
        5, '4'
    ],
    [
        1, '1'
    ],
    [
        2, '100'
    ],
    [
        1, '1'
    ],
    [
        3, '0.5'
    ],
    [
        4, '18.0'
    ],
    [
        5, '2'
    ],
    [
        4, '9'
    ],
    [
        5, '4'
    ]
]
quantities.each_with_index do |array, index|
  Quantity.create({ quantity: array[0], gram: array[1], food_id: index+1 })
end
