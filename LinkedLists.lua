local Node = {}
Node.__index = Node

function Node:new(value)
    return setmetatable({value = value, next = nil}, Node)
end

local LinkedList = {}
LinkedList.__index = LinkedList

function LinkedList:new()
    return setmetatable({head = nil}, LinkedList)
end

function LinkedList:insert(value)
    local newNode = Node:new(value)
    newNode.next = self.head
    self.head = newNode
end

function LinkedList:printList()
    local current = self.head
    while current do
        io.write(current.value .. " ")
        current = current.next
    end
    print()
end
