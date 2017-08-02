local Array = {
	--[[ Helper & Convenience Functions ]]--
	getTableType = function (this, t)
		local o = {isTable = false, isArray = false, isDictionary = false, isMixed = false}
		local ndx = 0

		if type(t) == 'table' then
			o.isTable = true

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
	
	IndexOf = function (this, t, item)
		local tableInfo = this:getTableType(t)
		local found = 0
		
		if tableInfo.isArray then
			for i, v in ipairs(t) do
				if item == v then
					found = i
					break
				end
			end
		else
			found = -1
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
	
	Reverse = function (this, t)
		local tableInfo = this:getTableType(t)
		local newArray = {}
		local position
		
		if tableInfo.isArray then
			position = #t
			for i, val in ipairs(t) do
				table.insert(newArray, t[position])
				position = position - 1
			end
		end
		
		return newArray, tableInfo
	end,
	
	Slice = function (this, t, begin, stop)
		local tableInfo = this:getTableType(t)
		local newArray = {}
		local L
		
		if tableInfo.isArray then
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
	
	Splice = function (this, t, begin, deleteCount, ...)
		local tableInfo = this:getTableType(t)
		local Removed = {}
		local Args = {...}
		local ArgsLength = this:Length(Args)
		local n = 0
		local L, stop, r
		
		if tableInfo.isArray then
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
	end
}

local getTableType = function ()
	return coroutine.create(Array.getTableType)
end

local isArray = function ()
	return coroutine.create(Array.isArray)
end

local isDictionary = function ()
	return coroutine.create(Array.isDictionary)
end

local isMixed = function ()
	return coroutine.create(Array.isMixed)
end

local Concat = function ()
	return coroutine.create(Array.Concat)
end

local Entries = function ()
	return coroutine.create(Array.Entries)
end

local From = function ()
	return coroutine.create(Array.From)
end

local IndexOf = function ()
	return coroutine.create(Array.IndexOf)
end

local Length = function ()
	return coroutine.create(Array.Length)
end

local Reverse = function ()
	return coroutine.create(Array.Reverse)
end

local Slice = function ()
	return coroutine.create(Array.Slice)
end

local Splice = function ()
	return coroutine.create(Array.Splice)
end

return {
	-- wrap functions
	getTableType = function (this, ...)
		local success, returnVal = coroutine.resume(getTableType(), Array, ...)
		
		return returnVal, success
	end,
	isArray = function (this, ...)
		local success, returnVal = coroutine.resume(isArray(), Array, ...)
		
		return returnVal, success
	end,
	isDictionary = function (this, ...)
		local success, returnVal = coroutine.resume(isDictionary(), Array, ...)
		
		return returnVal, success
	end,
	isMixed = function (this, ...)
		local success, returnVal = coroutine.resume(isMixed(), Array, ...)
		
		return returnVal, success
	end,
	Concat = function (this, ...)
		local success, returnVal = coroutine.resume(Concat(), Array, ...)
		
		return returnVal, success
	end,
	Entries = function (this, ...)
		local success, returnVal, info = coroutine.resume(Entries(), Array, ...)
		
		return returnVal, info
	end,
	From = function (this, ...)
		local success, returnVal = coroutine.resume(From(), Array, ...)
		
		return returnVal, success
	end,
	IndexOf = function (this, ...)
		local success, returnVal, info = coroutine.resume(IndexOf(), Array, ...)
		
		return returnVal, info
	end,
	Length = function (this, ...)
		local success, returnVal, info = coroutine.resume(Length(), Array, ...)
		
		return returnVal, info
	end,
	Reverse = function (this, ...)
		local success, returnVal, info = coroutine.resume(Reverse(), Array, ...)
		
		return returnVal, info
	end,
	Slice = function (this, ...)
		local success, returnVal, info = coroutine.resume(Slice(), Array, ...)
		
		return returnVal, info
	end,
	Splice = function (this, ...)
		local success, returnVal, info = coroutine.resume(Splice(), Array, ...)
		
		return returnVal, info
	end
}
