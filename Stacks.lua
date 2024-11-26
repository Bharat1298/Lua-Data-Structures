-- local linked_stack = {}

-- function linked_stack.new()
-- 	return {}
-- end

-- function linked_stack:empty()
-- 	return not self._top
-- end

-- function linked_stack:push(value)
-- 	self._top = { value = value, below = self._top }
-- end

-- function linked_stack:top()
-- 	if self:empty() then
-- 		return
-- 	end
-- 	return self._top.value
-- end

-- function linked_stack:pop()
-- 	if self:empty() then
-- 		return
-- 	end
-- 	local top_element = self:top()
-- 	self._top = self._top.below
-- 	return top_element
-- end

-- return require("class")(linked_stack)

local Stack = {}
Stack.__index = Stack

function Stack:new()
    return setmetatable({items = {}}, Stack)
end

function Stack:push(value)
    table.insert(self.items, value)
end

function Stack:pop()
    if #self.items == 0 then return nil end
    return table.remove(self.items)
end

function Stack:peek()
    return self.items[#self.items]
end

function Stack:isEmpty()
    return #self.items == 0
end
