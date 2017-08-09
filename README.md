ArrayForLua
===================

Array.lua contains a collection of Array methods for working with tables and arrays in Lua.

&nbsp;

> Roblox Developers:
> - Click on :page_facing_up: [**Array.lua**](https://github.com/blujagu/ArrayForLua/blob/master/Array.lua)
> - Click the <kbd>Raw</kbd> button
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

# How to Use

- There are two easy ways to use ArrayForLua methods:

  1. Wrap the table to give it Array methods (internally, via setmetatable).
  
  ```lua
  local t = {4, 1, 3, 2}
  
  Array(t)
  
  t:Sort()  -- {1, 2, 3, 4}
  ```
  
  2. Call Array methods directly, passing them a table as the first argument
  
    ```lua
    local t = {4, 1, 3, 2}
    
    Array.Sort(t)  -- {1, 2, 3, 4}
    ```
    
The API documentation below uses the first method to illustrate implementation as the syntax looks more like native Lua.


# ArrayForLua API

&nbsp;

|    Array Methods: B - F       |       Array Methods: I - R        | Array Methods: S - V  |     Array Utility Methods       |
| ----------------------------- | --------------------------------- | --------------------- | ------------------------------- |
| [BinaryFirst()](#binaryfirst) | [Includes()](#includes)           | [Shift()](#shift)     | [Length()](#length)             |
| [BinaryLast()](#binarylast)   | [IndexOf()](#indexof)             | [Slice()](#slice)     | [getTableType()](#gettabletype) |
| [BlockSwap()](#blockswap)     | [InsertionSort()](#insertionsort) | [Some()](#some)       | [isArray()](#isarray)           |
| [Concat()](#concat)           | [Join()](#join)                   | [Sort()](#sort)       | [isDictionary()](#isdictionary) |
| [Entries()](#entries)         | [Keys()](#keys)                   | [Splice()](#splice)   | [isEmpty()](#isempty)           |
| [Every()](#every)             | [LastIndexOf()](#lastindexof)     | [Swap()](#swap)       | [isMixed()](#ismixed)           |
| [Fill()](#fill)               | [Map()](#map)                     | [Unshift()](#unshift) | [isTable()](#istable)           |
| [Filter()](#filter)           | [Pop()](#pop)                     | [Values()](#values)   | [toString()](#tostring)         |
| [Find()](#find)               | [Push()](#push)                   |                       |                                 |
| [FindIndex()](#findindex)     | [Reduce()](#reduce)               |                       |                                 |
| [ForEach()](#foreach)         | [ReduceRight()](#reduceright)     |                       |                                 |
| [From()](#from)               | [Reverse()](#reverse)             |                       |                                 |
|                               | [Rotate()](#rotate)               |                       |                                 |

&nbsp;

----

&nbsp;

&nbsp;

### BinaryFirst

The **BinaryFirst()** method uses a binary search algorithm to locate instances of *searchElement* in *table* and returns the index of the first occurrence.
If *searchElement* is not found, `nil` is returned.


> #### Example

```lua
local A = Array({1, 1, 1, 2, 2, 2, 3, 3})

A:BinaryFirst(2)  -- 4
A:BinaryFirst(3)  -- 7
```


> #### Syntax

```lua
Array.BinaryFirst(array, searchElement, start, stop)
```


> #### Parameters

**array** `Required`
- The table to be searched must be an *array*.

**searchElement** `Required`
- The value to find in the array.

**start** <kbd>Optional</kbd>
- Location in the array to begin searching.

**stop** <kbd>Optional</kbd>
- Location in the array to stop searching.


> #### Return Value

- The first index of the item found in the array; or nil if the item was not found.

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)

&nbsp;

### BinaryLast


The **BinaryLast()** method uses a binary search algorithm to locate instances of *searchElement* in *table* and returns the index of the last occurrence.
If *searchElement* is not found, `nil` is returned.


> #### Example

```lua
local A = Array({1, 1, 1, 2, 2, 2, 3, 3})

A:BinaryLast(2)  -- 6
A:BinaryLast(3)  -- 8
```


> #### Syntax

```lua
Array.BinaryLast(array, searchElement, start, stop)
```


> #### Parameters

**array** `Required`
- The table to be searched must be an *array*.

**searchElement** `Required`
- The value to find in the array.

**start** <kbd>Optional</kbd>
- Location in the array to begin searching.

**stop** <kbd>Optional</kbd>
- Location in the array to stop searching.


> #### Return Value

- The last index of the item found in the array; or nil if the item was not found.

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)

&nbsp;

### BlockSwap


The **BlockSwap()** method exchanges one block *(range)* of items in an array with a second block of items.


> #### Example

```lua
local A = Array({1, 2, 3, 4, 5, 6, 7, 8})

A:BlockSwap(1, 5, 4)
unpack(A) -- 5  6  7  8  1  2  3  4
```


> #### Syntax

```lua
Array.BlockSwap(array, indexA, indexB, count)
```


> #### Parameters

**array** `Required`
- The table to be searched must be an *array*.

**indexA** `Required`
- Index in the array where the **first** block **begins**.

**indexB** `Required`
- Index in the array where the **second** block **begins**.

**count** `Required`
- The length of each block is equal to **count**; blocks must be of **equal size**.
- The last index of each block == `index[A|B] + count - 1`


> #### Return Value

- Returns the original, modified table.

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)

&nbsp;

### Concat


The **Concat()** method is used to merge two or more arrays. This method does not change the existing arrays, but instead returns a new array.


> #### Example

```lua
local A1 = Array({'a', 'b', 'c'})
local A2 = {'d', 'e', 'f'}

local A3 = A1:Concat(A2)

-- A3 is a new array { 'a', 'b', 'c', 'd', 'e', 'f' }
```


> #### Syntax

```lua
local newArray = Array.Concat(sourceArray, value1[, value2[, ...[, valueN]]])
```


> #### Parameters

**sourceArray** `Required`
- The initial table on which to add new values must be an *array*.

**valueN** `Required`
- Array(s) and/or value(s) to concatenate into a new array.

&nbsp;

The **Concat** method creates a new array consisting of the elements in the array on which it is called, followed in order by, for each argument, the elements of that argument (if the argument is an array) or the argument itself (if the argument is not an array). It does not recurse into nested array arguments.

&nbsp;

> #### Return Value

- A new Table instance of sub-type 'Array'

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)

&nbsp;

### Entries


The **Entries()** method returns a new Table Iterator object that contains the key/value pairs for each element in the table.


> #### Example 1: Calling the Iterator's internal *Next()* function

```lua
local A = Array({'a', 'b', 'c'})
local Next = A:Entries()

Next() -- 1  'a'
Next() -- 2  'b'
Next() -- 3  'c'
Next() -- nil  nil
```


> #### Example 2: Using `for`...`in` loop on an array

```lua
local A = Array({'a', 'b', 'c'})

for k, v in A:Entries() do
    print(k, v)
end
-- 1  'a'
-- 2  'b'
-- 3  'c'
```


> #### Example 3: Using `for`...`in` loop on a dictionary

```lua
local A = Array({foo='bar', faa='baz', fee='boz'})

for k, v in A:Entries() do
    print(k, v)
end
-- faa  'baz'
-- fee  'boz'
-- foo  'bar'
```


> #### Syntax

```lua
local iterator = Array.Entries(table)
```


> #### Parameters

**table** `Required`
- The table to iterate over can be array, dictionary, or mixed.


> #### Return Value

- The iterator function.

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)

&nbsp;

### Every


The **Every()** method tests whether all elements in a table pass the test implemented by the provided function.


> #### Example

```lua
local isBigEnough = function (element, index, array, this) { 
  return element >= 10 
}

local A1 = Array({12, 5, 8, 130, 44})
local A2 = Array({12, 54, 18, 130, 44})

A1:Every(isBigEnough)   -- false 
A2:Every(isBigEnough)   -- true
```


> #### Syntax

```lua
local isEveryTrue = Array.Every(table, function, context)
```


> #### Parameters

**table** `Required`
- The table to iterate over can be array, dictionary, or mixed.

**function** `Required`
- Function to test for each element, taking up to four arguments:
    - currentValue `Required`
        - The current element being processed in the table.
    - index <kbd>Optional</kbd>
        - The index of the current element being processed in the array.
        - For dictionary and mixed tables, the key is returned as the index.
    - table <kbd>Optional</kbd>
        - The table *Every* was called upon.
    - this <kbd>Optional</kbd>
        - The context to use for the *this* variable.
        - Defaults to the Array API Object.

**context** <kbd>Optional</kbd>
- Optional. Context for the *this* argument passed to *function*.

&nbsp;

The **Every** method executes the provided **function** once for each element present in **table** until it finds one where **function** returns a falsy value. If such an element is found, the **Every** method immediately returns false. Otherwise, if **function** returns a truthy value for all elements, **Every** returns true.

**function** is invoked with four arguments: the value of the element, the index of the element, the Table object being traversed, and a This object.

**Every** does not mutate **table** on which it was called.

The range of elements processed by **Every** is set before the first invocation of **function**. Elements which are appended to **table** after the call to **Every** begins will not be visited by **function**. If existing elements of **table** are changed, their value as passed to **function** will be the value at the time **Every** visits them; elements that are deleted are not visited.

**Every** acts like the "for all" quantifier in mathematics. In particular, for an empty table, it returns true.

&nbsp;

> #### Return Value

- The result. **true** if the callback function returns truthy for every table value; otherwise, **false**.

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)

&nbsp;

### Fill


The **Fill()** method fills all the elements of an array from a start index to an end index with a static value.

Dictionary and mixed tables have unordered indices, so they are always filled from end to end.


> #### Example

```lua
local A = Array({1, 2, 3})

A:Fill(1)

unpack(A) -- 1  1  1
```


> #### Syntax

```lua
Array.Fill(table, value, start, stop)
```


> #### Parameters

**table** `Required`
- The table to iterate over can be array, dictionary, or mixed.

**value** `Required`
- The value used to fill all elements of **table**.

**start** <kbd>Optional</kbd>
- First index, defaults to 1.
- Dictionary and mixed tables always use the default.

**stop** <kbd>Optional</kbd>
- Last index, defaults to the length of **table**.
- Dictionary and mixed tables always use the default.


> #### Return Value

- The original, modified **table**

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)

&nbsp;

### Filter


The **Filter()** method creates a new array with all elements that pass the test implemented by the provided function.


> #### Example 1: Filter a numeric array

```lua
local moreThanTen = function (n)
	return n > 10
end

local A1 = {12, 5, 8, 90, 44}

local Filtered = A1:Filter(moreThanTen)

unpack(Filtered)  -- 12  90  44
```

> #### Example 2: Filter a dictionary table

```lua
local moreThanTen = function (n)
	return n > 10
end

local Ages = Array({sam = 12, mike = 5, bob = 8, al = 90, jim = 44})

local Filtered = Ages:Filter(moreThanTen)

Array.toString(Filtered)  -- 'jim=44,al=90,sam=12'
```

> #### Example 3: Filter items based on search criteria (query)

```lua
local Fruit = Array({'apple', 'banana', 'grapes', 'mango', 'orange'})

local FilterItems = function (query)
  return Fruit:Filter(function (el)
      return string.find(string.lower(el), string.lower(query)) ~= nil
  end)
end

local Filtered = FilterItems('ap')
unpack(Filtered)  -- apple  grapes
Filtered = FilterItems('an')
unpack(Filtered)  -- banana  mango  orange
```

> #### Syntax

```lua
local newArray = Array.Filter(table, callback[, context])
```


> #### Parameters

**table** `Required`
- The table to **Filter** can be array, dictionary, or mixed.

**function** `Required`
- Function is a predicate, to test each element of the table. Return **true** to keep the element, **false** otherwise, taking up to four arguments:
    - currentValue `Required`
        - The current element being processed in the table.
    - index <kbd>Optional</kbd>
        - The index of the current element being processed in the array.
        - For dictionary and mixed tables, the key is returned as the index.
    - table <kbd>Optional</kbd>
        - The table *Filter* was called upon.
    - this <kbd>Optional</kbd>
        - The context to use for the *this* variable.
        - Defaults to the Array API Object.
        
**context** <kbd>Optional</kbd>
- Optional. Context for the *this* argument passed to *function*.

&nbsp;

**Filter()** does not mutate the table on which it is called.

&nbsp;


> #### Return Value

- A new array containing the elements that pass the test implemented by **function**.

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)

&nbsp;

### Find


The **Find()** method returns the value of the first element in a table that satisfies the provided testing function.


> #### Example

```lua
local moreThanTen = function (n)
	return n > 10
end

local A = Array({5, 9, 2, 42, 1, 16})

A:Find(moreThanTen)  -- 42
```


> #### Syntax

```lua
Array.Find(table, function, context)
```


> #### Parameters

**table** `Required`
- The table to search can be array, dictionary, or mixed.

**function** `Required`
- Function to execute on each value in the table, taking up to four arguments:
    - currentValue `Required`
        - The current element being processed in the table.
    - index <kbd>Optional</kbd>
        - The index of the current element being processed in the array.
        - For dictionary and mixed tables, the key is returned as the index.
    - table <kbd>Optional</kbd>
        - The table *Find* was called upon.
    - this <kbd>Optional</kbd>
        - The context to use for the *this* variable.
        - Defaults to the Array API Object.
        
**context** <kbd>Optional</kbd>
- Optional. Context for the *this* argument passed to *function*.


> #### Return Value

- The first value in the table that passes the test; otherwise, nil.

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)

&nbsp;

### FindIndex


The **FindIndex()** method returns the index of the first element in the array that satisfies the provided testing function or -1 if a match is not found.


> #### Example

```lua
local moreThanTen = function (n)
	return n > 10
end

local A = Array({5, 9, 2, 42, 1, 16})

A:FindIndex(moreThanTen)  -- 4
```


> #### Syntax

```lua
Array.FindIndex(array, function, context)
```


> #### Parameters

**array** `Required`
- The table to be searched must be an *array*.

**function** `Required`
- Function to execute on each value in the table, taking up to four arguments:
    - currentValue `Required`
        - The current element being processed in the array.
    - index <kbd>Optional</kbd>
        - The index of the current element being processed in the array.
    - table <kbd>Optional</kbd>
        - The array *FindIndex* was called upon.
    - this <kbd>Optional</kbd>
        - The context to use for the *this* variable.
        - Defaults to the Array API Object.
        
**context** <kbd>Optional</kbd>
- Optional. Context for the *this* argument passed to *function*.


> #### Return Value

- The first index within the array containing a value that passes the test; otherwise, -1.

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)

&nbsp;

### ForEach


The **ForEach()** method executes a provided function once for each table element.


> #### Example

```lua
local A = Array({'a', 'b', 'c'})

A.ForEach(function (element)
	print(element)
end)
-- 'a'
-- 'b'
-- 'c'
```


> #### Syntax

```lua
Array.ForEach(table, function, context)
```


> #### Parameters

**table** `Required`
- The table to enumerate can be array, dictionary, or mixed.

**function** `Required`
- Function to execute for each value in the table, taking up to four arguments:
    - currentValue <kbd>Optional</kbd>
        - The current element being processed in the table.
    - index <kbd>Optional</kbd>
        - The index of the current element being processed in the array.
        - For dictionary and mixed tables, the key is returned as the index.
    - table <kbd>Optional</kbd>
        - The table *ForEach* was called upon.
    - this <kbd>Optional</kbd>
        - The context to use for the *this* variable.
        - Defaults to the Array API Object.
        
**context** <kbd>Optional</kbd>
- Optional. Context for the *this* argument passed to *function*.


> #### Return Value

- nil.

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)

&nbsp;

### From


The **From()** method creates a new Array instance from a number, string, or table.


> #### Example 1: Array from string

```lua
local newArray = Array.From('test')

unpack(newArray)  --  t  e  s  t
```


> #### Example 2: Array from table

```lua
local oldArray = {'a', 'b', 1, 2}
local newArray = Array.From(oldArray)

newArray[1] = 'b'
unpack(newArray)  --  'b'  'b'  1  2
unpack(oldArray)  --  'a'  'b'  1  2
```


> #### Syntax

```lua
local newArray = Array.From(item)
```


> #### Parameters

**item** `Required`
- A number, string, or table used to generate a new array.


> #### Return Value

- A new Table instance of sub-type Array.

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)

&nbsp;

### Includes


The **Includes()** method determines whether a table includes a certain value, returning true or false as appropriate.


> #### Example

```lua
local A = Array({1, 2, 3})

A:Includes(2) -- true
A:Includes(4) -- false
```


> #### Syntax

```lua
Array.Includes(table, searchElement, start)
```


> #### Parameters

**table** `Required`
- The table to search can be array, dictionary, or mixed.

**searchElement** `Required`
- The value to search for.
        
**start** <kbd>Optional</kbd>
- The position in **table** at which to begin searching for **searchElement**.
- A negative value searches from the index of #**table** + **fromIndex**. Defaults to 1.
- **fromIndex** is ignored if **table** is a dictionary or mixed table.


> #### Return Value

- A Boolean. **true** if **table** contains **searchElement**, **false** otherwise.

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)

&nbsp;

### IndexOf


The **IndexOf()** method returns the first index at which a given value can be found in the array, or -1 if it is not present.


> #### Example

```lua
local A = Array({2, 9, 9})

A.indexOf(2) --  1 
A.indexOf(7) -- -1
```


> #### Syntax

```lua
Array.IndexOf(array, searchElement, start)
```


> #### Parameters

**array** `Required`
- The table to be searched must be an *array*.

**searchElement** `Required`
- The value to locate in **array**.
        
**start** <kbd>Optional</kbd>
- The position in **array** at which to begin searching for **searchElement**.
- A negative value searches from the index of #**array** + **fromIndex**. Defaults to 1.


> #### Return Value

- The first index of the value in **array**; -1 if not found.

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)

&nbsp;

### InsertionSort


The **InsertionSort()** method sorts an array, in-place, in ascending order.

> The insertion sort algorithm is extremely fast when sorting small arrays (from 2 to 10 items).

> Array.Sort() should be used to sort arrays larger than 10 items.

&nbsp;

> #### Example

```lua
local A = Array({9, 7, 6, 15, 16, 5, 10, 11})

A:InsertionSort()

unpack(A)  -- 5  6  7  9  10  11  15  16
```


> #### Syntax

```lua
Array.InsertionSort(array, start, stop)
```


> #### Parameters

**array** `Required`
- The table to be sorted must be an *array*.

**start** <kbd>Optional</kbd>
- Index of the first element in the range to be sorted. Defaults to 1.
        
**stop** <kbd>Optional</kbd>
- Index of the last element in the range to be sorted. Defaults to #**array**


> #### Return Value

- The original, sorted **array**.

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)

&nbsp;

### Join


The **Join()** method joins all values of a table into a string.


> #### Example

```lua
local A = Array({'Wind', 'Rain', 'Fire'})

A:Join()     -- 'Wind,Rain,Fire'
A:Join('-')  -- 'Wind-Rain-Fire'
```


> #### Syntax

```lua
Array.Join(table, separator)
```


> #### Parameters

**table** `Required`
- The table to **Join** can be array, dictionary, or mixed.

**separator** <kbd>Optional</kbd>
- Specifies a string to separate each element of the array. 
- **separator** is converted to a string if necessary. If omitted, the array elements are separated with a comma (','). 
- If **separator** is an empty string, all elements are joined without any characters between them.


> #### Return Value

- A string with all array values joined.

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)

&nbsp;

### Keys


The **Keys()** method returns a new Table Iterator that contains the keys for each element in the table.


> #### Example 1: Calling the Iterator's internal *Next()* function

```lua
local T = Array({a='foo', b='bar', c='baz'})

local Next = Array:Keys(T)

Next()  -- a
Next()  -- c
Next()  -- b
```


> #### Example 2: Using `for`...`in` loop

```lua
local T = Array({a='foo', b='bar', c='baz'})

for k in T:Keys() do
	print(k)
end
-- a
-- c
-- b
```


> #### Syntax

```lua
local iterator = Array.Keys(table)
```


> #### Parameters

**table** `Required`
- The table to iterate over can be array, dictionary, or mixed.


> #### Return Value

- The iterator function.

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)

&nbsp;

### LastIndexOf


The **LastIndexOf()** method returns the last index at which a given value can be found in the array, or -1 if it is not present.


> #### Example

```lua
local A = Array({2, 9, 9})

A:indexOf(2)  --  1 
A:indexOf(7)  -- -1
```


> #### Syntax

```lua
Array.IndexOf(array, searchElement, start)
```


> #### Parameters

**array** `Required`
- The table to be searched must be an *array*.

**searchElement** `Required`
- The value to locate in **array**.
        
**start** <kbd>Optional</kbd>
- The position in **array** at which to begin searching for **searchElement**.
- A negative value searches from the index of #**array** + **fromIndex**. Defaults to 1.


> #### Return Value

- The first index of the value in **array**; -1 if not found.

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)

&nbsp;

### Length


The **Length()** method returns the number of elements in a table.


> #### Example

```lua
local A = {'foo', 'bar', 'foobar'}
local T = {foo='foo', bar='bar', n=1}

A:Length()  -- 3
T:Length()  -- 3
```


> #### Syntax

```lua
Array.Length(table)
```


> #### Parameters

**table** `Required`
- The table to measure can be array, dictionary, or mixed.


> #### Return Value

- A number representing the number of elements in an array. -1 is returned if **array** is not a valid table.

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)

&nbsp;

### Map


The **Map()** method creates a new table with the results of calling a provided function on every element in a source table.


> #### Example

```lua
local A = Array({1, 5, 10, 15})
local doubles = A:Map(function (n) return n * 2 end)

unpack(doubles)  -- 2  10  20  30
unpack(A)        -- 1   5  10  15

local B = Array({1, 4, 9})
local Roots = B:Map(math.sqrt)

unpack(Roots)  -- 1  2  3
unpack(B)      -- 1  4  9
```


> #### Syntax

```lua
local mappedArray = Array.Map(table, function, context)
```


> #### Parameters

**table** `Required`
- The table to enumerate can be array, dictionary, or mixed.

**function** `Required`
- Function to execute for each value in the table, taking up to four arguments:
    - currentValue `Required`
        - The current element being processed in the table.
    - index <kbd>Optional</kbd>
        - The index of the current element being processed in the array.
        - For dictionary and mixed tables, the key is returned as the index.
    - table <kbd>Optional</kbd>
        - The table *Map* was called upon.
    - this <kbd>Optional</kbd>
        - The context to use for the *this* variable.
        - Defaults to the Array API Object.
        
**context** <kbd>Optional</kbd>
- Optional. Context for the *this* argument passed to *function*.

&nbsp;

**Map** does not mutate the table on which it is called (although **function**, if invoked, may do so).

&nbsp;


> #### Return Value

- A new table with each element being the result of the callback function.

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)

&nbsp;

### Pop


The **Pop()** method removes the **last** element from an array and returns that element.

This method changes the length of the array.


> #### Example

```lua
local A = Array({1, 2, 3})
local removed = A:Pop()

print(removed)    -- 3
unpack(A)         -- 1  2
```


> #### Syntax

```lua
local removedElement = Array.Pop(array)
```


> #### Parameters

**array** `Required`
- The table to be modified must be an *array*.


> #### Return Value

- The removed element from the array; nil if the array is empty or if the provided **array** is not an array.

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)

&nbsp;

### Push


The **Push()** method adds one or more elements to the end of an array and returns the new length of the array.


> #### Example

```lua
local A = Array({1, 2, 3})
local newLength = A:Push(4)

print(newLength)  -- 4
unpack(A)         -- 1  2  3  4

newLength = A:Push(5, 6, 7)

print(newLength)  -- 7
unpack(A)         -- 1  2  3  4  5  6  7
```


> #### Syntax

```lua
local newLength = Array.Push(array, [element1[, ...[, elementN]]])
```


> #### Parameters

**array** `Required`
- The table to be modified must be an *array*.

**elementN** `Required`
- The value(s) to add to the end of **array**.


> #### Return Value

- The new length of the array upon which the method was called.

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)

&nbsp;

### Reduce


The **Reduce()** method applies a function against an accumulator and each element in the array (from left to right) to reduce it to a single value.


> #### Example

```lua
local A1 = Array({0, 1, 2, 3})
local Reduced = A1:Reduce(function (sum, n)
	return sum + n
end)

print(Reduced)  -- 6

local A2 = Array({{0, 1}, {2, 3}, {4, 5}})

local Flattened = A2:Reduce(function (a, b)
	return Array.Concat(a, b)
end, {})

-- flattens to {0, 1, 2, 3, 4, 5}

unpack(Flattened)  -- 0  1  2  3  4  5
```


> #### Syntax

```lua
local reducedValue = Array.Reduce(array, function, initialValue)
```


> #### Parameters

**array** `Required`
- The table to be reduced must be an *array*.

**function** `Required`
- Function to execute on each element in the array, taking four arguments:
    - accumulator `Required`
        - The accumulator accumulates **function**'s return values; it is the accumulated value previously returned in the last invocation of **function**, or **initialValue**, if supplied (see below).
    - currentValue `Required`
        - The current element being processed in the array.
    - index <kbd>Optional</kbd>
        - The index of the current element being processed in the array.
        - Starting index is 1, if **initialValue** is provided, or index 2 otherwise.
    - table <kbd>Optional</kbd>
        - The table *Map* was called upon.
        
**initialValue** <kbd>Optional</kbd>
- Optional. Value to use as the first argument to the first call to **function**. If no initial value is supplied, the first element in the array will be used.

&nbsp;

Calling **Reduce** on an array does not mutate the original array.

For a detailed explanation of **Reduce**, visit [MDN Array.prototype.reduce: How Reduce Works](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Reduce#How_reduce_works), keeping in mind those examples are JavaScript which starts at index 0. Lua arrays start at index 1.

&nbsp;


> #### Return Value

- The value that results from the reduction.
- Calling **Reduce** on an empty array or non-array object both return nil.

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)

&nbsp;

### ReduceRight


The **ReduceRight()** method applies a function against an accumulator and each element in the array (from right to left) to reduce it to a single value.


> #### Example

```lua
local A = Array({0, 1, 2, 3, 4})
local Reduced = A:ReduceRight(function (prev, cur)
	return prev..', '..cur
end)

print(Reduced)  -- '4, 3, 2, 1, 0'
```


> #### Syntax

```lua
local reducedValue = Array.ReduceRight(array, function, initialValue)
```


> #### Parameters

**array** `Required`
- The table to be reduced must be an *array*.

**function** `Required`
- Function to execute on each element in the array, taking four arguments:
    - accumulator `Required`
        - The accumulator accumulates **function**'s return values; it is the accumulated value previously returned in the last invocation of **function**, or **initialValue**, if supplied (see below).
    - currentValue `Required`
        - The current element being processed in the array.
    - index <kbd>Optional</kbd>
        - The index of the current element being processed in the array.
        - Starting index is the length of **array**, if **initialValue** is provided, or #**array** - 1 otherwise.
    - table <kbd>Optional</kbd>
        - The table *Map* was called upon.
        
**initialValue** <kbd>Optional</kbd>
- Optional. Value to use as the first argument to the first call to **function**. If no initial value is supplied, the last element in the array will be used.

&nbsp;

Calling **ReduceRight** on an array does not mutate the original array.

For a detailed explanation of **ReduceRight**, visit [MDN Array.prototype.reduceRight](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/ReduceRight#Description), keeping in mind those examples are JavaScript which starts at index 0. Lua arrays start at index 1.

&nbsp;


> #### Return Value

- The value that results from the reduction.
- Calling **ReduceRight** on an empty array or non-array object both return nil.
- Calling **ReduceRight** on an array with 1 item immediately returns that item.

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)

&nbsp;

### Reverse


The **Reverse()** method reverses part or all of an array (in place).

When index positions are provided, a sub-array within the Array is reversed. Otherwise, the entire array is reversed.


> #### Example

```lua
local A1 = Array({'foo', 'bar', 'foobar'})

A1:Reverse()
unpack(A1)         --  foobar  bar  foo

local A2 = {1, 2, 3, 'a', 'b', 'c'}

A2:Reverse(3, 5)
unpack(A2)           --  1  2  b  a  3  c
```


> #### Syntax

```lua
Array.Reverse(array, start, stop)
```


> #### Parameters

**array** `Required`
- The table to be reversed must be an *array*.

**start** <kbd>Optional</kbd>
- The first index in the range of items to be reversed. Default is 1.
- If **start** is a negative number, the first index will be offset from the end of the array, and can be calculated as (**array** length) + (negative **start**)

**stop** <kbd>Optional</kbd>
- The last index in the range of items to be reversed. Default is the length of **array**.
- If **stop** is a negative number, the last index will be offset from the end of the array, and can be calculated as (**array** length) + (negative **stop**)

&nbsp;

**Reverse** modifies the array on which it is called.

If the calculated value of **stop** is less than the calculated value of **start**, no elements are moved and the array remains unaffected.

&nbsp;

> #### Return Value

- Returns the original, reversed array.

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)

&nbsp;

### Rotate


The **Rotate()** method moves a range of items in an array to the left or right by some number of spaces, with values on the edges wrapping around to the other end.


> #### Example

```lua
local A1 = Array({0, 1, 2, 3, 4})

A1:Rotate(1, 5, 1)
unpack(A1)  --  1  2  3  4  0

local A2 = Array({0, 1, 2, 3, 4, 5, 6})

A2:Rotate(3, 5, 1)
unpack(A2)     --  0  1  3  4  2  5  6
```


> #### Syntax

```lua
Array.Rotate(array, start, stop, step)
```


> #### Parameters

**array** `Required`
- The table to be rotated must be an *array*.

**start** `Required`
- The first index in the range of items to be rotated.
- If **start** is a negative number, the first index will be offset from the end of the array, and can be calculated as (**array** length) + (negative **start**)

**stop** `Required`
- The last index in the range of items to be reversed.
- If **stop** is a negative number, the last index will be offset from the end of the array, and can be calculated as (**array** length) + (negative **stop**)

**step** `Required`
- The number of spaces to move elements to the right or left. Positive **step** moves items left, while negative **step** moves items right. A **step** of 0 returns **array**, unmodified.

&nbsp;

**Rotate** modifies the array on which it is called.

When an item in the desired range is shifted left or right, another item is pushed off the end of the range as a result. That item is added to the opposite end of the range, allowing movement of items to wrap (rotate) through the table.

&nbsp;

> #### Return Value

- Returns the original, rotated array.

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)

&nbsp;

### Shift


The **Shift()** method removes the first element from an array and returns that element.

This method changes the length of the array.


> #### Example

```lua
local A = Array({1, 2, 3})
local removed = A:Shift()

unpack(A)         -- 2  3
print(removed)    -- 1
```


> #### Syntax

```lua
local removedElement = Array.Shift(array)
```


> #### Parameters

**array** `Required`
- The table to be modified must be an *array*.


> #### Return Value

- The removed element from the array; nil if the array is empty or if the provided **array** is not an array.

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)

&nbsp;

### Slice


The **Slice()** method creates a shallow copy of a portion of an array and returns it.

The original array is not modified.


> #### Example

```lua
local A = Array({'foo', 'bar', 'foobar'})
local newArray = A:Slice(2, 3)

unpack(newArray)  -- 'bar'  'foobar'
unpack(A)         -- 'foo'  'bar'  'foobar'

newArray = A:Slice(-1, -1)
unpack(newArray)    -- 'bar'
```


> #### Syntax

```lua
local newArray = Array.Slice(array, start, stop)
```


> #### Parameters

**array** `Required`
- The table to be modified must be an *array*.

**start** <kbd>Optional</kbd>
- The first index in the range of items to be returned. Default is 1.
- If **start** is a negative number, the first index will be offset from the end of the array, and can be calculated as (**array** length) + (negative **start**)

**stop** <kbd>Optional</kbd>
- The last index in the range of items to be returned. Default is the length of **array**.
- If **stop** is a negative number, the last index will be offset from the end of the array, and can be calculated as (**array** length) + (negative **stop**)


> #### Return Value

- A new array containing the extracted elements.

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)

&nbsp;

### Some


The **Some()** method tests whether some element in a table passes the test implemented by the provided function.


> #### Example

```lua
local moreThanTen = function (n)
	return n > 10
end

local A1 = Array({2, 5, 8, 1, 4})
local A2 = Array({2, 8, 1, 12, 4})

local someBiggerThanTen = A1:Some(moreThanTen)

print(someBiggerThanTen)  -- false

someBiggerThanTen = A2:Some(moreThanTen)

print(someBiggerThanTen)  -- true
```


> #### Syntax

```lua
local atLeastOneTrue = Array.Some(table, function, context)
```


> #### Parameters

**table** `Required`
- The table to enumerate can be array, dictionary, or mixed.

**function** `Required`
- Function to execute for each value in the table, taking up to four arguments:
    - currentValue `Required`
        - The current element being processed in the table.
    - index <kbd>Optional</kbd>
        - The index of the current element being processed in the array.
        - For dictionary and mixed tables, the key is returned as the index.
    - table <kbd>Optional</kbd>
        - The table **Some** was called upon.
    - this <kbd>Optional</kbd>
        - The context to use for the *this* variable.
        - Defaults to the Array API Object.
        
**context** <kbd>Optional</kbd>
- Optional. Context for the *this* argument passed to *function*.


> #### Return Value

- **true** if **function** returns a truthy value for any table value comparison; otherwise, **false**.

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)

&nbsp;

### Sort


The **Sort()** method sorts the elements of an array in place and returns the array.

If **Sort** is called on a dictionary or mixed table, an iterator is returned and the original table is not modified.


> #### Example 1: Ascending and descending sort on arrays

```lua
local A = Array({5, 9, 12, 2, 1, 55})

A:Sort()
table.concat(a, ', ')     -- 1, 2, 5, 9, 12, 55

A = Array({5, 9, 12, 2, 1, 55})  -- reset array

A:Sort(1)                 -- descending sort
table.concat(a, ', ')     -- 55, 12, 9, 5, 2, 1
```

> #### Example 2: Sort becomes an iterator when used on dictionary/mixed tables

```lua
local Scores = Array({tim = 45, tom = 90, ted = 20})

  -- Ascending
for k, v in Scores:Sort() do
	print(k..' has '..v..' points')
end
-- ted has 20 points
-- tim has 45 points
-- tom has 90 points

  -- Descending
for k, v in Scores:Sort(1) do
	print(k..' has '..v..' points')
end
-- tom has 90 points
-- tim has 45 points
-- ted has 20 points
```


> #### Syntax

```lua
Array.Sort(table, direction, function)
```


> #### Parameters

**table** `Required`
- The table to sort can be array, dictionary, or mixed.

**direction** <kbd>Optional</kbd>
- Optional. Sort descending by passing 1, ascending by passing -1. Default is -1 (ascending).

**function** <kbd>Optional</kbd>
- Function that defines the sort order, taking two arguments:
    - valueA `Required`
        - The first element to compare.
    - valueB `Required`
        - The second element to compare.
- **function** must return **true** if **valueA** should come before **valueB**.


> #### Return Value

- The original, sorted array if **table** is an *array*.
- Otherwise, an iterator is returned to enumerate **table** in sorted order.

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)

&nbsp;

### Splice


The **Splice()** method changes the contents of an array by removing existing elements and/or adding new elements.


> #### Example

```lua
local A = Array({'foo', 'bar', 'foobar'})

local Removed = A:Splice(2, 2, 'raboof', 'rab')

unpack(Removed)  -- 'bar'  'foobar'
unpack(A)        -- 'foo'  'raboof'  'rab'

  -- reset a
A = Array({'foo', 'bar', 'foobar'})

Removed = A:Splice(-1, 2)
unpack(Removed)  -- 'bar'  'foobar'
unpack(A)        -- 'foo'
```


> #### Syntax

```lua
local removedElements = Array.Splice(array, start, deleteCount, [element1[, ...[, elementN]]])
```


> #### Parameters

**array** `Required`
- The table to be modified must be an *array*.

**start** <kbd>Optional</kbd>
- The first index in the range of items to be removed. Default is 1.
- If **start** is a negative number, the start index will be offset from the end of the array, and can be calculated as (**array** length) + (negative **start**)
- If the final calculated value of the start index is less than or equal to 0, **start** is set to the length of **array**.

**deleteCount** <kbd>Optional</kbd>
- An integer indicating the number of old array elements to remove.
- If **deleteCount** is 0, no elements are removed. In this case, you should specify at least one new **element**.
- If **deleteCount** is greater than the number of elements left in **array** starting at **start**, then all of the elements through the end of **array** will be deleted.
- If **deleteCount** is omitted, then all of the elements beginning at **start** through the end of **array** will be deleted.

**elementN** <kbd>Optional</kbd>
The element(s) to add to **array**, beginning at **start**. If you don't specify any elements, **Splice()** will only remove elements from **array**.


> #### Return Value

- An array containing the deleted elements. If only one element is removed, an array of one element is returned.
- If no elements are removed, an empty array is returned.
- If **array** is not actually an *array*, nil is returned.

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)

&nbsp;

### Swap


The **Swap()** method exchanges the values at two locations in an array.


> #### Example

```lua
local A1 = Array({'a', 'b', 'c'})

A1:Swap(1, 3)

unpack(A1)  -- 'c'  'b'  'a'

local A2 = {'foo', 'bar', 'baz', 'foobar'}

A2:Swap(4, 2)

unpack(A2)  -- foo  foobar  baz  bar
```


> #### Syntax

```lua
Array.Swap(array, indexA, indexB)
```


> #### Parameters

**array** `Required`
- The table to be modified must be an *array*.

**indexA** `Required`
- Index of the value to move into **indexB** of **array**.

**indexB** `Required`
- Index of the value to move into **indexA** of **array**.


> #### Return Value

- The original, modified **array**

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)

&nbsp;

### Unshift


The **Unshift()** method adds one or more elements to the beginning of an array and returns the new length of the array.


> #### Example

```lua
local A = Array({1, 2, 3})

local newLength = A:Unshift(4, 5)

print(newLength)  -- 5
unpack(A)         -- 4  5  1  2  3
```


> #### Syntax

```lua
local newLength = Array.Unshift(array, [element1[, ...[, elementN]]])
```


> #### Parameters

**array** `Required`
- The table to be modified must be an *array*.

**elementN** `Required`
- The element(s) to add to the beginning of **array**.


> #### Return Value

- The new length of **array**.

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)

&nbsp;

### Values


The **Values()** method returns a new Table Iterator that contains the values for each element in the table.


> #### Example 1: Calling the Iterator's internal *Next()* function

```lua
local A = Array({'w', 'y', 'k', 'o', 'p'})

local Next = A:Values()

Next()  -- 'w'
Next()  -- 'y'
Next()  -- 'k'
Next()  -- 'o'
Next()  -- 'p'
Next()  -- nil
```


> #### Example 2: Using `for`...`in` loop

```lua
local T = Array({a='foo', b='bar', c='baz'})

for k in T:Values() do
	print(k)
end
-- 'foo'
-- 'baz'
-- 'bar'
```


> #### Syntax

```lua
local iterator = Array.Values(table)
```


> #### Parameters

**table** `Required`
- The table to iterate over can be array, dictionary, or mixed.


> #### Return Value

- The iterator function.

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)

&nbsp;

...more documentation is coming. The following utility methods are also available:

&nbsp;


**getTableType**

**isArray**

**isDictionary**

**isEmpty**

**isMixed**

**isTable**

**toString**

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)


[2]: https://www.roblox.com/games/962502063/Array-For-Lua  "Roblox"
