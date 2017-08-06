ArrayForLua
===================

This is a collection of Array methods for working with tables and arrays in Lua.

&nbsp;

> Roblox Developers: To use, start here on GitHub...
> - Click on **Array.lua**
> - Click the **Raw** button
> - Press <kbd>Ctrl+A</kbd> to Select All then <kbd>Ctrl+C</kbd> to Copy the code
> - Open Roblox Studio
> - Insert a ModuleScript into ReplicatedStorage
> - Rename the ModuleScript to **Array** and open the file
> - Delete the starter code in the file, then press <kbd>Ctrl+V</kbd> to paste in the Array code
> - To include the Array module in other scripts:
```lua
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local Array = require(ReplicatedStorage:WaitForChild('Array'))
```
> - Non-copylocked "Game" with full test coverage and implementation examples [here][2]

&nbsp;

# ArrayForLua API

&nbsp;

### Array:BinaryFirst()

The **BinaryFirst()** method uses a binary search algorithm to locate instances of *searchElement* in *table* and returns the index of the first occurrence.
If *searchElement* is not found, `nil` is returned.

```lua
local a = {1, 1, 1, 2, 2, 2, 3, 3}

Array:BinaryFirst(a, 2)  -- 4
Array:BinaryFirst(a, 3)  -- 7
```

#### Syntax

```lua
Array:BinaryFirst(table, searchElement, startIndex, stopIndex)
```

#### Parameters

**table**
- The table to be searched must be an *array*.

**searchElement**
- The thing to find in the array.

**startIndex** <kbd>Optional</kbd>
- Location in the array to begin searching.

**stopIndex** <kbd>Optional</kbd>
- Location in the array to stop searching.

#### Return Value

- The first index of the item found in the array; or nil if the item was not found.

----


**Array:BinaryLast()**

**Array:BlockSwap()**

**Array:Concat()**

**Array:Entries()**

**Array:Every()**

**Array:Fill()**

**Array:Filter()**

**Array:Find()**

**Array:FindIndex()**

**Array:ForEach()**

**Array:From()**

**Array:Includes()**

**Array:IndexOf()**

**Array:InsertionSort()**

**Array:Join()**

**Array:Keys()**

**Array:LastIndexOf()**

**Array:Length()**

**Array:Map()**

**Array:Pop()**

**Array:Push()**

**Array:Reduce()**

**Array:ReduceRight()**

**Array:Reverse()**

**Array:Rotate()**

**Array:Shift()**

**Array:Slice()**

**Array:Some()**

**Array:Sort()**

**Array:Splice()**

**Array:Swap()**

**Array:Unshift()**

**Array:Values()**

**Array:getTableType()**

**Array:isArray()**

**Array:isDictionary()**

**Array:isEmpty()**

**Array:isMixed()**

**Array:isTable()**

**Array:toString()**


[2]: https://www.roblox.com/games/962502063/Array-For-Lua  "Roblox"
