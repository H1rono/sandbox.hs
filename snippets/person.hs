data Person = Person
    { firstName :: String
    , lastName :: String
    , age :: Int
    -- , height :: Float
    -- , phoneNumber :: String
    -- , flavor :: String
    } deriving (Eq, Show, Read)

mikeD = Person {firstName = "Michael", lastName = "Diamond", age = 20}
adRock = Person {firstName = "Adam", lastName = "Horovitz", age = 21}
mca = Person {firstName = "Adam", lastName = "Yauch", age = 24}
