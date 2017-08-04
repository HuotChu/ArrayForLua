local Array = {
	--[[ Helper & Convenience Functions ]]--
	getTableType = function (this, t)
		local o = {isTable = false, isArray = false, isDictionary = false, isMixed = false}
		local ndx = 0

		if type(t) == 'table' then
			o.isTable = true
			if #t == 0 then
				o.isArray = true
			else
				for i, val in ipairs(t) do
					ndx = ndx + 1
					if i ~= ndx then
						o.isArray = false
						break
					end
					o.isArray = true
				end
				
				if not o.isArray then
					for k, v in pairs(t) do
						if type(k) == 'number' then
							o.isDictionary = false
							o.isMixed = true
							break
						end
						o.isDictionary = true
						o.isMixed = false
					end
				end
			end
		end
		
		return o
	end,
	
	isArray = function (this, t)
		local tableInfo = this:getTableType(t)
		
		return tableInfo.isArray
	end,
	
	isDictionary = function (this, t)
		local tableInfo = this:getTableType(t)
		
		return tableInfo.isDictionary
	end,
	
	isMixed = function (this, t)
		local tableInfo = this:getTableType(t)
		
		return tableInfo.isMixed
	end,
	
------------------[[  Array Methods  ]]------------------

	BlockSwap = function (this, t, rangeA, rangeB)
		-- no sanity checks on args...
		-- BlockSwap is optimized for Array:Sort
		local startA = rangeA.Start
		local startB = rangeB.Start
		local stopA = rangeA.Stop
		local stopB = rangeB.Stop
		local distance = stopB - startB
		local blockA = {}
		local n = 0
		
		for i = startA, stopA do
			table.insert(blockA, t[i])
		end
		
		for i = startA, startA + distance do
			t[i] = t[startB + n]
			n = n + 1
		end
		
		n = 1
		
		for i = startB, stopB do
			t[i] = blockA[n]
			n = n + 1
		end
		
		return nil
	end,
	
	Concat = function (this, t, ...)
		local tableInfo = this:getTableType(t)
		local newArray = {}
		local Args = {...}
		local arg, tempInfo
		
		if tableInfo.isArray then
			newArray = this:From(t)
			for i = 1, #Args do
				arg = Args[i]
				if type(arg) == 'table' then
					tempInfo = this:getTableType(arg)
					if tempInfo.isArray then
						for _, v in ipairs(arg) do
							table.insert(newArray, v)
						end
					end
				else
					table.insert(newArray, arg)
				end
			end
		end
		
		return newArray
	end,
	
	Entries = function (this, t)
		local co
		local tableInfo = this:getTableType(t)
		local iterateArray = function ()
			for i, v in ipairs(t) do
				coroutine.yield(i, v)
			end
		end
		local iterateTable = function ()
			for k, v in pairs(t) do
				coroutine.yield(k, v)
			end
		end
		local Next = function ()
			if not co then return nil, nil end			
			
			local _, key, val = coroutine.resume(co)

			return key, val
		end
		
		if tableInfo.isTable then
			if tableInfo.isArray then
				co = coroutine.create(iterateArray)
			else
				co = coroutine.create(iterateTable)
			end
		end
		
		return Next, tableInfo
	end,
	
	Every = function (this, t, callBack, context)
		if context and setfenv then
			setfenv(callBack, context)
		end
		
		local tableInfo = this:getTableType(t)
		
		local success, result
		
		if tableInfo.isTable then
			if tableInfo.isArray then
				for i, v in ipairs(t) do
					success, result = pcall(callBack, v, i, t)
					if not success or not result then
						break
					end
				end
			else
				for k, v in pairs(t) do
					success, result = pcall(callBack, v, k, t)
					if not success or not result then
						break
					end
				end
			end
		end
		
		return result, tableInfo
	end,
	
	Fill = function (this, t, val, start, stop)
		local tableInfo = this:getTableType(t)
		local length
		
		if tableInfo.isTable then
			length = this:Length(t)
			if not start or start < 1 then
				start = 1
			end
			if not stop or stop > length then
				stop = length
			end
			if tableInfo.isArray then
				for i = start, stop do
					t[i] = val
				end
			else
				for k, _ in pairs(t) do
					t[k] = val
				end
			end
		end
		
		return t, tableInfo
	end,
	
	Filter = function (this, t, callBack, context)
		if context and setfenv then
			setfenv(callBack, context)
		end

		local tableInfo = this:getTableType(t)
		local returnArray = {}
		local success, result
		
		if tableInfo.isTable then
			if tableInfo.isArray then
				for i, v in ipairs(t) do
					success, result = pcall(callBack, v, i, t)
					if success and result then
						table.insert(returnArray, v)
					end
				end
			else
				for k, v in pairs(t) do
					success, result = pcall(callBack, v, k, t)
					if success and result then
						returnArray[k] = v
					end
				end
			end
		end
		
		return returnArray, tableInfo
	end,
	
	Find = function (this, t, callBack, context)
		if context and setfenv then
			setfenv(callBack, context)
		end

		local tableInfo = this:getTableType(t)
		local success, result
		
		if tableInfo.isTable then
			if tableInfo.isArray then
				for i, v in ipairs(t) do
					success, result = pcall(callBack, v, i, t)
					if success and result then
						result = v
						break
					end
				end
			else
				for k, v in pairs(t) do
					success, result = pcall(callBack, v, k, t)
					if success and result then
						result = v
						break
					end
				end
			end
		end
		
		return result, tableInfo
	end,
	
	FindIndex = function (this, t, callBack, context)
		if context and setfenv then
			setfenv(callBack, context)
		end

		local tableInfo = this:getTableType(t)
		local success, result
		
		if tableInfo.isArray then
			for i, v in ipairs(t) do
				success, result = pcall(callBack, v, i, t)
				if success and result then
					result = i
					break
				end
			end
		end

		return result, tableInfo
	end,
	
	ForEach = function (this, t, callBack, context)
		if context and setfenv then
			setfenv(callBack, context)
		end

		local tableInfo = this:getTableType(t)
		local success, result
		
		if tableInfo.isTable then
			if tableInfo.isArray then
				for i, v in ipairs(t) do
					success, result = pcall(callBack, v, i, t)
				end
			else
				for k, v in pairs(t) do
					success, result = pcall(callBack, v, k, t)
				end
			end
		end
		
		return nil, tableInfo
	end,
	
	From = function (this, o)
		local kind = type(o)
		local t = {}
		
		if kind == 'number' then
			o = tostring(o)
		end
		
		if kind == 'string' then
			for i = 1, string.len(o) do
				table.insert(t, i, string.sub(o, i, i))
			end
		elseif kind == 'table' then
			for k, v in pairs(o) do
				table.insert(t, v)
			end
		end
		
		return t
	end,
	
	Includes = function (this, t, searchElement, fromIndex)
		local tableInfo = this:getTableType(t)
		local length, result
		
		if tableInfo.isTable then
			length = this:Length(t)
			if fromIndex and fromIndex > length then
				result = false
			elseif fromIndex and fromIndex < 0 then
				fromIndex = length + fromIndex
				if fromIndex < 1 then
					fromIndex = 1
				end
			end
			if result == nil then
				if tableInfo.isArray then
					if not fromIndex then
						fromIndex = 1
					end
					for i = fromIndex, length do
						if t[i] == searchElement then
							result = true
							break
						end
						result = false
					end
				else
					for k, v in pairs(t) do
						if v == searchElement then
							result = true
							break
						end
						result = false
					end
				end
			end
		end
		
		return result, tableInfo
	end,
	
	IndexOf = function (this, t, searchElement, fromIndex)
		local tableInfo = this:getTableType(t)
		local found
		
		if tableInfo.isArray then
			if not fromIndex then
				fromIndex = 1
			elseif fromIndex < 0 then
				fromIndex = #t + 1 + fromIndex
			end
			if fromIndex < 1 then
			   fromIndex = 1
			end
			for i = fromIndex, #t do
				if searchElement == t[i] then
					found = i
					break
				end
				found = -1
			end
		end
		
		return found, tableInfo
	end,
	
	Join = function (this, t, separator)
		local tableInfo = this:getTableType(t)
		local str
		
		separator = separator or ','

		if tableInfo.isTable then
			if not tableInfo.isArray then
				t = this:From(t)
			end
			str = table.concat(t, separator)
		end

		return str, tableInfo
	end,
	
	Keys = function (this, t)
		local co
		local tableInfo = this:getTableType(t)
		local iterateArray = function ()
			for i = 1, #t do
				coroutine.yield(i)
			end
		end
		local iterateTable = function ()
			for k, v in pairs(t) do
				coroutine.yield(k)
			end
		end
		local Next = function ()
			if not co then return nil, nil end			
			
			local _, key = coroutine.resume(co)

			return key
		end
		
		if tableInfo.isTable then
			if tableInfo.isArray then
				co = coroutine.create(iterateArray)
			else
				co = coroutine.create(iterateTable)
			end
		end
		
		return Next, tableInfo
	end,
	
	LastIndexOf = function (this, t, searchElement, fromIndex)
		local tableInfo = this:getTableType(t)
		local found = -1
		local length
		
		if tableInfo.isArray then
			length = #t
			
			if not fromIndex or fromIndex > length then
				fromIndex = length
			elseif fromIndex < 0 then
				fromIndex = length + fromIndex + 1
			end
			
			if fromIndex < 1 then
			   found = -1
			else
				for i = fromIndex, 1, -1 do
					if searchElement == t[i] then
						found = i
						break
					end
				end
			end
		else
			found = nil
		end
		
		return found, tableInfo
	end,
	
	Length = function (this, t)
		local tableInfo = this:getTableType(t)
		local n = 0
		local length = -1
		
		if tableInfo.isTable then
			if tableInfo.isArray then
				length = #t
			else
				for k, v in pairs(t) do
					n = n + 1
				end
				
				length = n
			end
		end

		return length, tableInfo
	end,
	
	Map = function (this, t, callBack, context)
		if context and setfenv then
			setfenv(callBack, context)
		end

		local tableInfo = this:getTableType(t)
		local returnArray = {}
		local success, result
		
		if tableInfo.isTable then
			if tableInfo.isArray then
				for i, v in ipairs(t) do
					success, result = pcall(callBack, v, i, t)
					if success then
						table.insert(returnArray, result)
					end
				end
			else
				for k, v in pairs(t) do
					success, result = pcall(callBack, v, k, t)
					if success then
						returnArray[k] = result
					end
				end
			end
		else
			returnArray = nil
		end
		
		return returnArray, tableInfo
	end,
	
	Pop = function (this, t)
		local tableInfo = this:getTableType(t)
		local removed
		
		if tableInfo.isArray then
			removed = table.remove(t)
		end
		
		return removed, tableInfo
	end,
	
	Push = function (this, t, ...)
		local tableInfo = this:getTableType(t)
		local Args = {...}
		local length
		
		if tableInfo.isArray and #Args > 0 then
			for _, arg in ipairs(Args) do
				table.insert(t, arg)
			end
			length = #t
		end
		
		return length, tableInfo
	end,
	
	Reduce = function (this, t, callBack, initialValue)
		local tableInfo = this:getTableType(t)
		local accumulator, success, currentValue, reducedValue, start, length
		
		if tableInfo.isArray and #t > 0 and callBack and type(callBack) == 'function' then
			length = #t
			if length == 1 then
				reducedValue = t[1]
			else
				if initialValue ~= nil then
					accumulator = initialValue
					start = 1
				else
					accumulator = t[1]
					start = 2
				end
				for i = start, length do
					currentValue = t[i]
					success, reducedValue = pcall(callBack, accumulator, currentValue, i, t)
					if success then
						accumulator = reducedValue
					else
						reducedValue = nil
						break
					end
				end
			end

		end
		
		return reducedValue, tableInfo
	end,
	
	ReduceRight = function (this, t, callBack, initialValue)
		local tableInfo = this:getTableType(t)
		local accumulator, success, currentValue, reducedValue, start, length
		
		if tableInfo.isArray and #t > 0 and callBack and type(callBack) == 'function' then
			length = #t
			if length == 1 then
				reducedValue = t[1]
			else
				if initialValue ~= nil then
					accumulator = initialValue
					start = length
				else
					accumulator = t[length]
					start = length - 1
				end
				for i = start, 1, -1 do
					currentValue = t[i]
					success, reducedValue = pcall(callBack, accumulator, currentValue, i, t)
					if success then
						accumulator = reducedValue
					else
						reducedValue = nil
						break
					end
				end
			end

		end
		
		return reducedValue, tableInfo
	end,
	
	Reverse = function (this, t)
		local tableInfo = this:getTableType(t)
		local newArray, position
		
		if tableInfo.isArray then
			newArray = {}
			position = #t
			for i, val in ipairs(t) do
				table.insert(newArray, t[position])
				position = position - 1
			end
		end
		
		return newArray, tableInfo
	end,
	
	Shift = function (this, t)
		local tableInfo = this:getTableType(t)
		local removed
		
		if tableInfo.isArray and #t > 0 then
			removed = table.remove(t, 1)
		end
		
		return removed, tableInfo
	end,
	
	Slice = function (this, t, begin, stop)
		local tableInfo = this:getTableType(t)
		local newArray, L
		
		if tableInfo.isArray then
			newArray = {}
			L = #t
			
			if not begin then
				begin = 1
			elseif begin < 0 then
				begin = L + begin
			end
			
			if begin <= 0 then
				begin = L
			end
			
			if not stop then
				stop = L
			elseif stop < 0 then
				stop = L + stop
			end			
			
			if stop > L or stop == 0 then
				stop = L
			end

			for i = begin, stop do
				table.insert(newArray, t[i])
			end
		end
		
		return newArray, tableInfo
	end,
	
	Some = function (this, t, callBack, context)
		if context and setfenv then
			setfenv(callBack, context)
		end
		
		local tableInfo = this:getTableType(t)
		
		local success, result
		
		if tableInfo.isTable then
			if tableInfo.isArray then
				for i, v in ipairs(t) do
					success, result = pcall(callBack, v, i, t)
					if success and result then
						break
					end
				end
			else
				for k, v in pairs(t) do
					success, result = pcall(callBack, v, k, t)
					if success and result then
						break
					end
				end
			end
		end
		
		return result, tableInfo
	end,
	
	Sort = function (this, t, ...)
		local tableInfo = this:getTableType(t)
		local Args = {...}
		local direction, sortFunction
		
		if tableInfo.isTable then
			if #Args > 0 then
				direction = Args[1]
				if type(direction) == 'function' then
					sortFunction = direction
					direction = 1
				elseif #Args == 2 then
					sortFunction = Args[2]
				end 
			end
			
			-- TODO: Implement block sort
			
		end
	end,
	
	Splice = function (this, t, begin, deleteCount, ...)
		local tableInfo = this:getTableType(t)
		local Args = {...}
		local ArgsLength = this:Length(Args)
		local n = 0
		local Removed, L, stop, r
		
		if tableInfo.isArray then
			Removed = {}
			L = #t
			if begin > L then
				begin = L
			elseif begin < 0 then
				begin = L + begin
			end
			
			if begin <= 0 then
				begin = L
			end
			
			if deleteCount and deleteCount > 0 then
				stop = begin + deleteCount
				if stop > L then
					stop = L
				end
				for i = stop, begin, -1 do
					r = table.remove(t, i)
					table.insert(Removed, r)
				end
				if #Removed > 0 then
					Removed = this:Reverse(Removed)
				end
			end
			
			if ArgsLength > 0 then
				if deleteCount and deleteCount == 0 then
					begin = begin + 1
				end
				stop = begin + ArgsLength - 1
				for i = begin, stop do
					n = n + 1
					table.insert(t, i, Args[n])
				end
			end
		end
		
		return Removed, tableInfo
	end,
	
	Swap = function (this, t, ndx1, ndx2)
		-- no sanity checks on args...
		-- Swap is optimized for Array:Sort
		local tmp = t[ndx1]
		
		t[ndx1] = t[ndx2]
		t[ndx2] = tmp

		return nil
	end
	
}

return Array
