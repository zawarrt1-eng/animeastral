-- Advanced Game Inventory System
-- Showcases: Tables, Metatables, Closures, Error Handling, Complex Logic

local Inventory = {}
Inventory.__index = Inventory

-- Create new inventory with maximum capacity
function Inventory.new(maxSlots, playerName)
	local self = setmetatable({}, Inventory)
	self.items = {}
	self.maxSlots = maxSlots or 20
	self.playerName = playerName or "Player"
	self.gold = 0
	self.locked = false
	return self
end

-- Add item with quantity validation
function Inventory:addItem(itemName, quantity, rarity)
	if self.locked then
		return false, "Inventory is locked"
	end
	
	local slot = #self.items + 1
	if slot > self.maxSlots then
		return false, "Inventory full"
	end
	
	-- Create item with metadata
	local item = {
		name = itemName,
		qty = quantity or 1,
		rarity = rarity or "common",
		timestamp = os.time(),
		id = math.random(1000, 9999)
	}
	
	-- Apply rarity multiplier
	local multiplier = 1.0
	if rarity == "rare" then
		multiplier = 1.5
	elseif rarity == "epic" then
		multiplier = 2.0
	elseif rarity == "legendary" then
		multiplier = 3.0
	end
	
	item.value = math.floor(quantity * 10 * multiplier)
	table.insert(self.items, item)
	
	return true, "Added " .. itemName
end

-- Calculate total inventory value
function Inventory:getTotalValue()
	local total = self.gold
	local count = 0
	
	for i = 1, #self.items do
		local item = self.items[i]
		total = total + (item.value or 0)
		count = count + 1
	end
	
	return total, count
end

-- Find items by rarity with filtering
function Inventory:findByRarity(targetRarity)
	local matches = {}
	local pattern = string.lower(targetRarity)
	
	for _, item in pairs(self.items) do
		if string.lower(item.rarity) == pattern then
			table.insert(matches, item.name)
		end
	end
	
	return matches
end

-- Sell item with price calculation
function Inventory:sellItem(index)
	if index < 1 or index > #self.items then
		return false
	end
	
	local item = table.remove(self.items, index)
	local salePrice = math.floor(item.value * 0.75)
	self.gold = self.gold + salePrice
	
	return true, salePrice
end

-- Protected transaction with error handling
function Inventory:safeTransaction(callback)
	self.locked = true
	
	local success, result = pcall(function()
		return callback(self)
	end)
	
	self.locked = false
	return success, result
end

-- Initialize player inventory
local playerInventory = Inventory.new(25, "Hero")

-- Add various items
playerInventory:addItem("Health Potion", 5, "common")
playerInventory:addItem("Mana Crystal", 3, "rare")
playerInventory:addItem("Dragon Scale", 1, "legendary")
playerInventory:addItem("Iron Sword", 1, "epic")
playerInventory:addItem("Gold Coins", 100, "common")

-- Calculate statistics
local totalValue, itemCount = playerInventory:getTotalValue()
print("Inventory Value: " .. totalValue .. " gold")
print("Total Items: " .. itemCount)

-- Find legendary items
local legendaries = playerInventory:findByRarity("legendary")
print("Legendary Items: " .. table.concat(legendaries, ", "))

-- Perform safe transaction
local success, price = playerInventory:safeTransaction(function(inv)
	return inv:sellItem(2)
end)

if success then
	print("Sold item for " .. price .. " gold")
	print("New Balance: " .. playerInventory.gold .. " gold")
end
