-- std.collide
-- collisions by AABB, planned SAT convex

c = {}
bft = {} -- box function table
cmft = {} -- compound function table

function c.newBox(xP, yP, wP, hP, flagP)
  return setmetatable({x = xP,
                       y = yP,
                       width = wP,
                       height = hP,
                       flag = flagP},
                      {__index = bft})
end

function c.newCompound(xP, yP, boxesP) -- holds a table of boxes
  return setmetatable({x = xP,
                       y = yP,
                       boxes = boxesP,
                       isCompound = true},
                      {__index = cmft})
end

function bft:distanceFrom(otherP) -- takes a collision box or anything else
                                 -- with an x/y
  d = (self.x - otherP.x) ^ 2 + (self.y - otherP.y) ^ 2
  return math.sqrt(d)
end

function bft:aabb(otherP) -- takes a collision box
  if other.isCompound then
    return other:aabb(self)
  end
  return (self.x < otherP.x + otherP.width) and
         (self.x + self.width > otherP.x) and
         (self.y < otherP.y + otherP.height) and
         (otherP.y < self.y + self.height)
end

function bft:update(xP, yP)
  self.x = xP or self.x
  self.y = yP or self.y
end

function cmft:update(xP, yP)
  xDiff = self.x - xP
  yDiff = self.y - yP
  self.x = xP
  self.y = yP
  for i, v in ipairs(self.boxes) do
    v.x = v.x - xDiff
    v.y = v.y - yDiff
  end
end

return c;
