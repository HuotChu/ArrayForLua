local Methods = {}

local val_to_str = function (v)
	if 'string' == type(v) then
		v = string.gsub(v, '\n', '\\n')
		if string.match(string.gsub(v, '[^\'"]', ''), '^"+$') then
			return '"'..v..'"'
		end
		
		return "'"..string.gsub(v, "'", '\\"').."'"
	else
		return 'table' == type(v) and Methods.toString(v) or tostring(v)
	end
end

local key_to_str = function (k)
	if 'string' == type(k) and string.match(k, '^[_%a][_%a%d]*$') then
		return k
	else
		return '['..val_to_str(k)..']'
	end
end

Methods = {
	--[[ Helper & Convenience Functions ]]--
	getTableType = function (t)
		local o = {isTable = false, isArray = false, isDictionary = false, isMixed = false}
		local ndx = 0
		
		if not t then return nil end

		if type(t) == 'table' then
			o.isTable = true
			if Methods.isEmpty(t) then
				o.isArray = true
			else
				for i, val in ipairs(t) do
					ndx = ndx + 1
					if i ~= ndx then
						o.isArray = false
						o.isMixed = true
						break
					end
					o.isArray = true
				end
				
				if not o.isArray and not o.isMixed then
					for k, v in pairs(t) do
						if type(k) == 'number' then
							o.isDictionary = false
							break
						end
						o.isDictionary = true
					end
				end
			end
		end
		
		return o
	end,
	
	isArray = function (t)
		if not t then return nil end

		local tableInfo = Methods.getTableType(t)
		
		return tableInfo.isArray
	end,
	
	isDictionary = function (t)
		if not t then return nil end
		
		local tableInfo = Methods.getTableType(t)
		
		return tableInfo.isDictionary
	end,
	
	isEmpty = function (t)
		if not t then return nil end

	    for k, v in pairs(t) do
	        return false
	    end

	    return true
	end,
	
	isMixed = function (t)
		if not t then return nil end
		
		local tableInfo = Methods.getTableType(t)
		
		return tableInfo.isMixed
	end,
	
	isTable = function (t)
		if not t then return nil end
		
		return type(t) == 'table'
	end,
	
	toString = function (t)
		if not t then return nil end
		
		local tableInfo = Methods.getTableType(t)
		local result, done = {}, {}
		
		if tableInfo.isTable then
			for k, v in ipairs(t) do
				table.insert(result, val_to_str(v))
				done[k] = true
			end
			
			for k, v in pairs(t) do
				if not done[k] then
					table.insert(result, key_to_str(k)..'='..val_to_str(v))
				end
			end
			
			done = table.concat(result, ',')
		else
			done = false
		end
		
		return done
	end,
	
------------------[[  Array Methods  ]]------------------

	BinaryFirst = function (t, searchElement, startIndex, stopIndex)
		local middle, value
		
		if not startIndex then
			startIndex = 1
		end
		
		if not stopIndex then
			stopIndex = #t
		end
		
		while startIndex < stopIndex do
			middle = math.floor( startIndex + (stopIndex - startIndex) * .5 )
			value = t[middle]
			if value < searchElement then
				startIndex = middle + 1
			else
				stopIndex = middle
			end
		end
		
		if startIndex == stopIndex and t[startIndex] < searchElement then
			startIndex = startIndex + 1
		end
		
		if startIndex > #t then
			startIndex = nil
		end
		
		return startIndex
	end,
	
	BinaryLast = function (t, searchElement, startIndex, stopIndex)
		local middle, value
		
		if not startIndex then
			startIndex = 1
		end
		
		if not stopIndex then
			stopIndex = #t
		end
		
		while startIndex < stopIndex do
			middle = math.floor( startIndex + (stopIndex - startIndex) * .5 )
			value = t[middle]
			if value <= searchElement then
				startIndex = middle + 1
			else
				stopIndex = middle
			end
		end
		
		if startIndex == stopIndex and t[startIndex] > searchElement and t[startIndex - 1] == searchElement then
			startIndex = startIndex - 1
		elseif startIndex >= #t and t[startIndex] ~= searchElement and t[startIndex - 1] ~= searchElement then
			startIndex = nil
		end
		
		return startIndex
	end,

	BlockSwap = function (t, indexA, indexB, count)
		local stopA = indexA + count - 1
		local stopB = indexB + count - 1
		local blockA = {}
		local n = 0
		
		for i = indexA, stopA do
			table.insert(blockA, t[i])
			t[i] = t[indexB + n]
			n = n + 1
		end
		
		n = 1
		
		for i = indexB, stopB do
			t[i] = blockA[n]
			n = n + 1
		end
		
		return t
	end,
	
	Concat = function (t, ...)
		local tableInfo = Methods.getTableType(t)
		local newArray = {}
		local Args = {...}
		local arg, tempInfo
		
		if tableInfo.isArray then
			newArray = Methods.From(t)
			for i = 1, #Args do
				arg = Args[i]
				if type(arg) == 'table' then
					tempInfo = Methods.getTableType(arg)
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
	
	Entries = function (t)
		local co
		local tableInfo = Methods.getTableType(t)
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
		
		return Next
	end,
	
	Every = function (t, callBack, context)
		local tableInfo = Methods.getTableType(t)
		
		local success, result
		
		if tableInfo.isTable then
			if Methods.isEmpty(t) then
				return true, tableInfo
			end
			if tableInfo.isArray then
				for i, v in ipairs(t) do
					success, result = pcall(callBack, v, i, t, context or Methods)
					if not success or not result then
						break
					end
				end
			else
				for k, v in pairs(t) do
					success, result = pcall(callBack, v, k, t, context or Methods)
					if not success or not result then
						break
					end
				end
			end
		end
		
		return result
	end,
	
	Fill = function (t, val, start, stop)
		local tableInfo = Methods.getTableType(t)
		local length
		
		if tableInfo.isTable then
			length = Methods.Length(t)
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
		
		return t
	end,
	
	Filter = function (t, callBack, context)
		local tableInfo = Methods.getTableType(t)
		local returnArray = {}
		local success, result
		
		if tableInfo.isTable then
			if tableInfo.isArray then
				for i, v in ipairs(t) do
					success, result = pcall(callBack, v, i, t, context or Methods)
					if success and result then
						table.insert(returnArray, v)
					end
				end
			else
				for k, v in pairs(t) do
					success, result = pcall(callBack, v, k, t, context or Methods)
					if success and result then
						returnArray[k] = v
					end
				end
			end
		end
		
		return returnArray
	end,
	
	Find = function (t, callBack, context)
		local tableInfo = Methods.getTableType(t)
		local success, result, found
		
		if tableInfo.isTable then
			if tableInfo.isArray then
				for i, v in ipairs(t) do
					success, result = pcall(callBack, v, i, t, context or Methods)
					if success and result then
						found = v
						break
					end
				end
			else
				for k, v in pairs(t) do
					success, result = pcall(callBack, v, k, t, context or Methods)
					if success and result then
						found = v
						break
					end
				end
			end
		end
		
		return found
	end,
	
	FindIndex = function (t, callBack, context)
		local tableInfo = Methods.getTableType(t)
		local found = -1
		local success, result
		
		if tableInfo.isArray then
			for i, v in ipairs(t) do
				success, result = pcall(callBack, v, i, t, context or Methods)
				if success and result then
					found = i
					break
				end
			end
		end

		return found
	end,
	
	ForEach = function (t, callBack, context)
		local tableInfo = Methods.getTableType(t)
		local success, result
		
		if tableInfo.isTable then
			if tableInfo.isArray then
				for i, v in ipairs(t) do
					success, result = pcall(callBack, v, i, t, context or Methods)
				end
			else
				for k, v in pairs(t) do
					success, result = pcall(callBack, v, k, t, context or Methods)
				end
			end
		end
		
		return nil
	end,
	
	From = function (o)
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
	
	Includes = function (t, searchElement, fromIndex)
		local tableInfo = Methods.getTableType(t)
		local length, result
		
		if tableInfo.isTable then
			length = Methods.Length(t)
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
		
		return result
	end,
	
	IndexOf = function (t, searchElement, fromIndex)
		local tableInfo = Methods.getTableType(t)
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
		
		return found
	end,
	
	InsertionSort = function (t, start, stop)
		local tmp, j
		
		if not start then
			start = 1
		end
		
		if not stop then
			stop = #t
		end
		
		if stop == 0 then
			return nil, false
		end
		
		for i = start + 1, stop do
			tmp = t[i]
			j = i - 1
			
			while j > 0 and t[j] > tmp do
				t[j+1] = t[j]
				j = j - 1
			end
			
			t[j + 1] = tmp
		end
		
		return t
	end,
	
	Join = function (t, separator)
		local tableInfo = Methods.getTableType(t)
		local str
		
		separator = separator or ','

		if tableInfo.isTable then
			if not tableInfo.isArray then
				t = Methods.From(t)
			end
			str = table.concat(t, separator)
		end

		return str
	end,
	
	Keys = function (t)
		local co
		local tableInfo = Methods.getTableType(t)
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
		
		return Next
	end,
	
	LastIndexOf = function (t, searchElement, fromIndex)
		local tableInfo = Methods.getTableType(t)
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
		
		return found
	end,
	
	Length = function (t)
		local tableInfo = Methods.getTableType(t)
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

		return length
	end,
	
	Map = function (t, callBack, context)
		local tableInfo = Methods.getTableType(t)
		local returnArray = {}
		local success, result
		
		if tableInfo.isTable then
			if tableInfo.isArray then
				for i, v in ipairs(t) do
					success, result = pcall(callBack, v, i, t, context or Methods)
					if success then
						table.insert(returnArray, result)
					end
				end
			else
				for k, v in pairs(t) do
					success, result = pcall(callBack, v, k, t, context or Methods)
					if success then
						returnArray[k] = result
					end
				end
			end
		else
			returnArray = nil
		end
		
		return returnArray
	end,
	
	Pop = function (t)
		local tableInfo = Methods.getTableType(t)
		local removed
		
		if tableInfo.isArray then
			removed = table.remove(t)
		end
		
		return removed
	end,
	
	Push = function (t, ...)
		local tableInfo = Methods.getTableType(t)
		local Args = {...}
		local length
		
		if tableInfo.isArray and #Args > 0 then
			for _, arg in ipairs(Args) do
				table.insert(t, arg)
			end
			length = #t
		end
		
		return length
	end,
	
	Reduce = function (t, callBack, initialValue)
		local tableInfo = Methods.getTableType(t)
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
		
		return reducedValue
	end,
	
	ReduceRight = function (t, callBack, initialValue)
		local tableInfo = Methods.getTableType(t)
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
		
		return reducedValue
	end,
	
	Reverse = function (t, start, stop)
		local tableInfo = Methods.getTableType(t)
		local length, distance, temp, startIndex, stopIndex
		
		if tableInfo.isArray then
			length = #t
			
			if not start then
				start = 1
			elseif start < 1 then
				start = stop - start
			end
			
			if start == 0 then
				start = stop
			end
			
			if not stop or stop > length then
				stop = length
			elseif stop < 1 then
				stop = length - stop
			end
			
			if stop < start then
				stop = start
			end

			distance = stop - start
			
			for i = math.floor(distance * .5), 0, -1 do
				startIndex = start + i
				stopIndex = stop - i
				if startIndex ~= stopIndex then
					temp = t[startIndex]
					t[startIndex] = t[stopIndex]
					t[stopIndex] = temp
				end
			end
		end
		
		return t
	end,
	
	Rotate = function (t, start, stop, step)
		local length = #t
		local split, calculatedStart, calculatedStop
		
		if start and stop and step and step ~= 0 then
			split = start + step
	
			if step > 0 then
				calculatedStop = split - 1
			else
				calculatedStop = stop + step
			end
			
			Methods.Reverse(t, start, calculatedStop)
			Methods.Reverse(t, calculatedStop + 1, stop)
			Methods.Reverse(t, start, stop)
		end
		
		return t
	end,
	
	Shift = function (t)
		local tableInfo = Methods.getTableType(t)
		local removed
		
		if tableInfo.isArray and #t > 0 then
			removed = table.remove(t, 1)
		end
		
		return removed
	end,
	
	Slice = function (t, begin, stop)
		local tableInfo = Methods.getTableType(t)
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
		
		return newArray
	end,
	
	Some = function (t, callBack, context)
		local tableInfo = Methods.getTableType(t)
		
		local success, result
		
		if tableInfo.isTable then
			if tableInfo.isArray then
				for i, v in ipairs(t) do
					success, result = pcall(callBack, v, i, t, context or Methods)
					if success and result then
						break
					end
				end
			else
				for k, v in pairs(t) do
					success, result = pcall(callBack, v, k, t, context or Methods)
					if success and result then
						break
					end
				end
			end
		end
		
		return result
	end,
	
	Sort = function (t, ...)
		local tableInfo = Methods.getTableType(t)
		local Args = {...}
		local direction, sortFunction, tableSort
		
		local descend = function (a, b)
			return a > b
		end
		
		local tableAscend = function (a, b)
			return t[a] < t[b]
		end
		
		local tableDescend = function (a, b)
			return t[a] > t[b]
		end
			
		if tableInfo.isTable then
			if #Args > 0 then
				direction = Args[1]
				if type(direction) == 'function' then
					sortFunction = direction
					direction = -1
				elseif #Args == 2 then
					sortFunction = Args[2]
				end
			end
			
			if tableInfo.isArray then
				if not sortFunction and direction and direction == 1 then
					-- direction: -1 == ascending, 1 == descending
					sortFunction = descend
				end
				-- sort an array using shellsort
				table.sort(t, sortFunction)
			else
				-- sorting a dictionary or mixed table
				if not sortFunction then 
					if direction and direction == 1 then
						sortFunction = tableDescend
					else
						sortFunction = tableAscend					
					end
				end
				
				local KeyMap = {}
				local x = 0
				
				local iterate = function ()
					for i, v in ipairs(KeyMap) do
						coroutine.yield(v, t[v])
					end
				end
				
				local co = coroutine.create(iterate)
				
				local Next = function ()
					if not co then return nil end			
					
					local _, key, val = coroutine.resume(co)
		
					return key, val
				end
				
				for k in pairs(t) do
					x = x + 1
					KeyMap[x] = k
				end
				
				table.sort(KeyMap, sortFunction)

				return Next, t
			end
			
		end
		
		return t
	end,
	
	Splice = function (t, begin, deleteCount, ...)
		local tableInfo = Methods.getTableType(t)
		local Args = {...}
		local ArgsLength = Methods.Length(Args)
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
			
			if not deleteCount then
			    deleteCount = L
			end
			
			if deleteCount > 0 then
				stop = begin + deleteCount
				if stop > L then
					stop = L
				end
				for i = stop, begin, -1 do
					r = table.remove(t, i)
					table.insert(Removed, r)
				end
				if #Removed > 0 then
					Removed = Methods.Reverse(Removed)
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
		
		return Removed
	end,
	
	Swap = function (t, ndx1, ndx2)
		local tableInfo = Methods.getTableType(t)
		local tmp
		
		if tableInfo.isArray then
			tmp = t[ndx1]
			t[ndx1] = t[ndx2]
			t[ndx2] = tmp
		end

		return t
	end,
	
	Unshift = function (t, ...)
		local Args = {...}
		local tableInfo = Methods.getTableType(t)
		local length
		
		if tableInfo.isArray then
			for i, v in ipairs(Args) do
				table.insert(t, i, v)
			end
			length = #t
		end
		
		return length
	end,
	
	Values = function (t)
		local co
		local tableInfo = Methods.getTableType(t)
		local iterateArray = function ()
			for i, v in ipairs(t) do
				coroutine.yield(v)
			end
		end
		local iterateTable = function ()
			for k, v in pairs(t) do
				coroutine.yield(v)
			end
		end
		local Next = function ()
			if not co then return nil end			
			
			local _, val = coroutine.resume(co)

			return val
		end
		
		if tableInfo.isTable then
			if tableInfo.isArray then
				co = coroutine.create(iterateArray)
			else
				co = coroutine.create(iterateTable)
			end
		end
		
		return Next
	end
	
}

local Array = {
	__index = function (t, k)
		if Methods[k] then return Methods[k]
		else return t[k]
		end
	end
}

setmetatable(Array, {
	__index = function (t, k)
		if Methods[k] then return Methods[k]
		else return rawget(t, k)
		end
	end,
	
	__call = function (self, t)
		setmetatable(t, self)
		return t
	end
})

return Array
