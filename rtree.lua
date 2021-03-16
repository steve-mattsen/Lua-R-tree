require 'class'
require 'nodes'

RTree = class(function(r, maxChildren)
  if (maxChildren == nil) then
    r.maxChildren = 9
  else
    r.maxChildren = maxChildren
  end
  r.children = { RTreeNode() }
end)

function RTree:insert(data, bbox)
  local child = self:findBestChild(bbox)
  child:insert(data, bbox)
end

function RTree:findBestChild(bbox)
  if #self.children == 1 then
    return self.children[1]
  end
  local bestChild = nil
  local bestChildOverlap = math.huge * -1
  for i, v in pairs(self.children) do
    local overlap = bbox.overlap(v.bbox)
    if overlap > bestChildOverlap then
      bestChild = v
      bestChildOverlap = overlap
    end
  end
  return bestChild
end
