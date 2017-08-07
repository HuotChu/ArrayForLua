ArrayForLua
===================

This is a collection of Array methods for working with tables and arrays in Lua.

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

# ArrayForLua API

+ [Array:BinaryFirst()](#binaryfirst)
+ [Array:BinaryLast()](#binarylast)
+ [Array:BlockSwap()](#blockswap)
+ [Array:Concat()](#concat)
+ [Array:Entries()](#entries)
+ [Array:Every()](#every)
+ [Array:Fill()](#fill)
+ [Array:Filter()](#filter)
+ [Array:Find()](#find)
+ [Array:FindIndex()](#findindex)
+ [Array:ForEach()](#foreach)
+ [Array:From()](#from)
+ [Array:Includes()](#includes)
+ [Array:IndexOf()](#indexof)
+ [Array:InsertionSort()](#insertionsort)
+ [Array:Join()](#join)
+ [Array:Keys()](#keys)
+ [Array:LastIndexOf()](#lastindexof)
+ [Array:Length()](#length)

&nbsp;

----

&nbsp;

&nbsp;

### BinaryFirst

The **BinaryFirst()** method uses a binary search algorithm to locate instances of *searchElement* in *table* and returns the index of the first occurrence.
If *searchElement* is not found, `nil` is returned.


> #### Example

```lua
local a = {1, 1, 1, 2, 2, 2, 3, 3}

Array:BinaryFirst(a, 2)  -- 4
Array:BinaryFirst(a, 3)  -- 7
```


> #### Syntax

```lua
Array:BinaryFirst(array, searchElement, start, stop)
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
local a = {1, 1, 1, 2, 2, 2, 3, 3}

Array:BinaryLast(a, 2)  -- 6
Array:BinaryLast(a, 3)  -- 8
```


> #### Syntax

```lua
Array:BinaryLast(array, searchElement, start, stop)
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
local a = {1, 2, 3, 4, 5, 6, 7, 8}

Array:BlockSwap(a, 1, 5, 4)
unpack(a) -- 5  6  7  8  1  2  3  4
```


> #### Syntax

```lua
Array:BlockSwap(array, indexA, indexB, count)
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
local arr1 = {'a', 'b', 'c'}
local arr2 = {'d', 'e', 'f'}

local arr3 = Array:Concat(arr1, arr2)

-- arr3 is a new array { 'a', 'b', 'c', 'd', 'e', 'f' }
```


> #### Syntax

```lua
local newArray = Array:Concat(sourceArray, value1[, value2[, ...[, valueN]]])
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
local a = {'a', 'b', 'c'}
local iterator = Array:Entries(a)

iterator() -- 1  'a'
iterator() -- 2  'b'
iterator() -- 3  'c'
iterator() -- nil  nil
```


> #### Example 2: Using `for`...`in` loop on an array

```lua
local a = {'a', 'b', 'c'}

for k, v in Array:Entries(a) do
    print(k, v)
end
-- 1  'a'
-- 2  'b'
-- 3  'c'
```


> #### Example 3: Using `for`...`in` loop on a dictionary

```lua
local a = {foo='bar', faa='baz', fee='boz'}

for k, v in Array:Entries(a) do
    print(k, v)
end
-- faa  'baz'
-- fee  'boz'
-- foo  'bar'
```


> #### Syntax

```lua
local iterator = Array:Entries(table)
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

Array:Every({12, 5, 8, 130, 44}, isBigEnough)     -- false 
Array:Every({12, 54, 18, 130, 44}, isBigEnough)   -- true
```


> #### Syntax

```lua
local isEveryTrue = Array:Every(table, function, context)
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
local a = {1, 2, 3}

Array:Fill(a, 1)

unpack(a) -- 1  1  1
```


> #### Syntax

```lua
Array:Fill(table, value, start, stop)
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

local filtered = Array:Filter({12, 5, 8, 90, 44}, moreThanTen)

unpack(filtered)  -- 12 90 44
```

> #### Example 2: Filter a dictionary table

```lua
local moreThanTen = function (n)
	return n > 10
end

local filtered = Array:Filter({sam=12, mike=5, bob=8, al=90, jim=44}, moreThanTen)

Array:toString(filtered)  -- jim=44,al=90,sam=12
```

> #### Example 3: Filter items based on search criteria (query)

```lua
local fruit = {'apple', 'banana', 'grapes', 'mango', 'orange'}

local filterItems = function (query)
  return Array:Filter(fruit, function (el)
      return string.find(string.lower(el), string.lower(query)) ~= nil
  end)
end

filtered = filterItems('ap')
unpack(filtered)  -- apple  grapes
filtered = filterItems('an')
unpack(filtered)  -- banana  mango  orange
```

> #### Syntax

```lua
local newArray = Array:Filter(table, callback[, context])
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

Array:Find({5, 9, 2, 42, 1, 16}, moreThanTen)  -- 42
```


> #### Syntax

```lua
Array:Find(table, function, context)
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

Array:FindIndex({5, 9, 2, 42, 1, 16}, moreThanTen)  -- 4
```


> #### Syntax

```lua
Array:FindIndex(array, function, context)
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
Array:ForEach({'a', 'b', 'c'}, function (element)
	print(element)
end)
-- 'a'
-- 'b'
-- 'c'
```


> #### Syntax

```lua
Array:ForEach(table, function, context)
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
local newArray = Array:From('test')

unpack(newArray)  --  t  e  s  t
```


> #### Example 2: Array from table

```lua
local oldArray = {'a', 'b', 1, 2}
local newArray = Array:From(oldArray)

newArray[1] = 'b'
unpack(newArray)  --  'b'  'b'  1  2
unpack(oldArray)  --  'a'  'b'  1  2
```


> #### Syntax

```lua
local newArray = Array:From(item)
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
local a = {1, 2, 3}
Array:Includes(a, 2) -- true
Array:Includes(a, 4) -- false
```


> #### Syntax

```lua
Array:Includes(table, searchElement, start)
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
local a = {2, 9, 9}; 
a.indexOf(2); --  1 
a.indexOf(7); -- -1
```


> #### Syntax

```lua
Array:IndexOf(array, searchElement, start)
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

> Array:Sort() should be used to sort arrays larger than 10 items.

&nbsp;

> #### Example

```lua
local a = {9, 7, 6, 15, 16, 5, 10, 11}
Array:InsertionSort(a)

unpack(a)  -- 5  6  7  9  10  11  15  16
```


> #### Syntax

```lua
Array:InsertionSort(array, start, stop)
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
local a = {'Wind', 'Rain', 'Fire'}

Array:Join(a)       -- 'Wind,Rain,Fire'
Array:Join(a, '-')  -- 'Wind-Rain-Fire'
```


> #### Syntax

```lua
Array:Join(table, separator)
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
local t = {a='foo', b='bar', c='baz'}

iterator = Array:Keys(t)
iterator()  -- a
iterator()  -- c
iterator()  -- b
```


> #### Example 2: Using `for`...`in` loop

```lua
local t = {a='foo', b='bar', c='baz'}

for k in Array:Keys(a) do
	print(k)
end
-- a
-- c
-- b
```


> #### Syntax

```lua
local iterator = Array:Keys(table)
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
local a = {2, 9, 9}; 
a.indexOf(2); --  1 
a.indexOf(7); -- -1
```


> #### Syntax

```lua
Array:IndexOf(array, searchElement, start)
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
Array:Length({'foo', 'bar', 'foobar'})     -- 3
Array:Length({foo='foo', bar='bar', n=1})  -- 3
```


> #### Syntax

```lua
Array:Length(table)
```


> #### Parameters

**table** `Required`
- The table to iterate over can be array, dictionary, or mixed.


> #### Return Value

- A number representing the number of elements in an array. -1 is returned if **array** is not a valid table.

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)

&nbsp;

...more documentation is coming. The following methods are also available:

&nbsp;


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

:wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash::wavy_dash:[:top:](#arrayforlua-api)


[2]: https://www.roblox.com/games/962502063/Array-For-Lua  "Roblox"
