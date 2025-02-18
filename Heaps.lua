-- local heap = {}
-- local metatable = { __index = heap }

-- function heap.less_than(a, b)
-- 	return a < b
-- end

-- function heap:_swap(i, j)
-- 	self[i], self[j] = self[j], self[i]
-- end

-- function heap:_insert(val)
-- 	table.insert(self, val)
-- end

-- function heap:_remove()
-- 	return table.remove(self)
-- end

-- function heap:_heapify_down(index)
-- 	local left_child = index * 2
-- 	if left_child > #self then
-- 		return
-- 	end
-- 	local smallest_child = left_child + 1 -- right child
-- 	if smallest_child > #self or self.less_than(self[left_child], self[smallest_child]) then
-- 		smallest_child = left_child
-- 	end
-- 	if self.less_than(self[smallest_child], self[index]) then
-- 		self:_swap(index, smallest_child)
-- 		return self:_heapify_down(smallest_child)
-- 	end
-- end

-- function heap:_heapify_up(index)
-- 	if index == 1 then
-- 		return
-- 	end
-- 	local parent = math.floor(index / 2)
-- 	if self.less_than(self[index], self[parent]) then
-- 		self:_swap(index, parent)
-- 		return self:_heapify_up(parent)
-- 	end
-- end

-- function heap.new(
-- 	self, -- list to heapify, optional, defaults to the empty list
-- 	less_than -- comparator, optional, defaults to `function(a, b) return a < b end`
-- )
-- 	self = setmetatable(self or {}, metatable)
-- 	self.less_than = less_than
-- 	for i = math.floor(#self / 2), 1, -1 do -- iterate over all parents, from lower to higher levels...
-- 		self:_heapify_down(i) -- ... and heapify each.
-- 	end
-- 	return self
-- end

-- function heap:empty()
-- 	return self[1] == nil
-- end

-- function heap:size()
-- 	return #self
-- end

-- function heap:push(value)
-- 	self:_insert(value)
-- 	self:_heapify_up(#self)
-- end

-- function heap:top()
-- 	return self[1]
-- end

-- function heap:pop()
-- 	self:_swap(1, #self)
-- 	local value = self:_remove()
-- 	if not self:empty() then
-- 		self:_heapify_down(1)
-- 	end
-- 	return value
-- end

-- return heap

local MinHeap = {}
MinHeap.__index = MinHeap

function MinHeap:new()
    return setmetatable({data = {}}, MinHeap)
end

local function swap(heap, i, j)
    heap.data[i], heap.data[j] = heap.data[j], heap.data[i]
end

local function heapifyUp(heap, index)
    local parent = math.floor(index / 2)
    if parent >= 1 and heap.data[index] < heap.data[parent] then
        swap(heap, index, parent)
        heapifyUp(heap, parent)
    end
end

local function heapifyDown(heap, index)
    local left = index * 2
    local right = left + 1
    local smallest = index

    if left <= #heap.data and heap.data[left] < heap.data[smallest] then
        smallest = left
    end
    if right <= #heap.data and heap.data[right] < heap.data[smallest] then
        smallest = right
    end
    if smallest ~= index then
        swap(heap, index, smallest)
        heapifyDown(heap, smallest)
    end
end

function MinHeap:insert(value)
    table.insert(self.data, value)
    heapifyUp(self, #self.data)
end

function MinHeap:extractMin()
    if #self.data == 0 then return nil end
    local minValue = self.data[1]
    self.data[1] = self.data[#self.data]
    table.remove(self.data)
    heapifyDown(self, 1)
    return minValue
end

function MinHeap:peek()
    return self.data[1]
end
