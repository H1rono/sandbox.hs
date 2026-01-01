module Shapes
( Point(..)
, Shape(..)
, area
, nudge
, baseCircle
, baseRect
) where

-- x y
data Point = Point Float Float
    deriving (Show)

data Shape =
    Circle Point Float |
    Rectangle Point Point
    deriving (Show)

area :: Shape -> Float
area (Circle _ radius) = pi * (radius ^ 2)
area (Rectangle (Point x1 y1) (Point x2 y2)) = (abs $ x1 - x2) * (abs $ y1 - y2)

-- shape dx dy
nudge :: Shape -> Float -> Float -> Shape
nudge (Circle (Point x y) r) dx dy = Circle p r
    where p = Point (x + dx) (y + dy)
nudge (Rectangle (Point x1 y1) (Point x2 y2)) dx dy = Rectangle p1 p2
    where
        p1 = Point (x1 + dx) (y1 + dy)
        p2 = Point (x2 + dx) (y2 + dy)

baseCircle :: Float -> Shape
baseCircle radius = Circle (Point 0 0) radius

baseRect :: Float -> Float -> Shape
baseRect width height = Rectangle (Point 0 0) (Point width height)
