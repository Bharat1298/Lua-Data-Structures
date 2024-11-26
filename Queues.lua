-- local linked_queue = {}

-- function linked_queue.new()
-- 	return {}
-- end

-- function linked_queue:empty()
-- 	return not self._top
-- end

-- function linked_queue:push(value)
-- 	if self:empty() then
-- 		self._top = { value = value }
-- 		self._bottom = self._top
-- 	else
-- 		self._bottom.below = { value = value }
-- 		self._bottom = self._bottom.below
-- 	end
-- end

-- function linked_queue:top()
-- 	if self:empty() then
-- 		return
-- 	end
-- 	return self._top.value
-- end

-- function linked_queue:pop()
-- 	if self:empty() then
-- 		return
-- 	end
-- 	local top_element = self:top()
-- 	self._top = self._top.below
-- 	if self:empty() then -- List became empty through popping
-- 		self._bottom = nil
-- 	end
-- 	return top_element
-- end

-- return require("class")(linked_queue)

local Queue = {}
Queue.__index = Queue

function Queue:new()
    return setmetatable({items = {}}, Queue)
end

function Queue:enqueue(value)
    table.insert(self.items, value)
end

function Queue:dequeue()
    if #self.items == 0 then return nil end
    return table.remove(self.items, 1)
end

function Queue:peek()
    return self.items[1]
end

function Queue:isEmpty()
    return #self.items == 0
end
