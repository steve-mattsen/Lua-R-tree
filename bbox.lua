require 'class'

BBox = class(function(b, x1, y1, x2, y2)
  b.minX = x1
  b.minY = y1
  b.maxX = x2
  b.maxY = y2
end)

function BBox:overlap(bbox)
  -- Returns the area of overlap between the two bboxes.
  -- If there's no overlap, return a negative number.
  if bbox == nil then
    return math.huge * -1
  end
  local lowestMaxX = self.maxX
  local lowestMaxY = self.maxY
  local highestMinX = self.maxX
  local highestMinY = self.maxY
  if bbox2.maxX < self.maxX then
    lowestMaxX = bbox2.maxX
  end
  if bbox2.maxY < self.maxY then
    lowestMaxY = bbox2.maxY
  end
  if bbox2.minX > self.minX then
    highestMinX = bbox2.minX
  end
  if bbox2.minY > self.minY then
    highestMinY = bbox2.minY
  end
  -- We now have an overlap box. Calculate side lengths.
  local length = lowestMaxX - highestMinX
  local height = lowestMaxY - highestMinY
  if length < 0 and height < 0 then
    -- If both are negative, the result will be falsely positive.
    return length * height * -1
  else
    return length * height
  end
end
