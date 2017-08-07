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


> #### Example

```lua
local a = {1, 1, 1, 2, 2, 2, 3, 3}

Array:BinaryFirst(a, 2)  -- 4
Array:BinaryFirst(a, 3)  -- 7
```


> #### Syntax

```lua
Array:BinaryFirst(table, searchElement, startIndex, stopIndex)
```


> #### Parameters

**table** `Required`
- The table to be searched must be an *array*.

**searchElement** `Required`
- The thing to find in the array.

**startIndex** <kbd>Optional</kbd>
- Location in the array to begin searching.

**stopIndex** <kbd>Optional</kbd>
- Location in the array to stop searching.


> #### Return Value

- The first index of the item found in the array; or nil if the item was not found.

----

&nbsp;

### Array:BinaryLast()


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
Array:BinaryLast(table, searchElement, startIndex, stopIndex)
```


> #### Parameters

**table** `Required`
- The table to be searched must be an *array*.

**searchElement** `Required`
- The thing to find in the array.

**startIndex** <kbd>Optional</kbd>
- Location in the array to begin searching.

**stopIndex** <kbd>Optional</kbd>
- Location in the array to stop searching.


> #### Return Value

- The last index of the item found in the array; or nil if the item was not found.

----

&nbsp;

### Array:BlockSwap()


The **BlockSwap()** method exchanges one block *(range)* of items in an array with a second block of items.


> #### Example

```lua
local a = {1, 2, 3, 4, 5, 6, 7, 8}

Array:BlockSwap(a, 1, 5, 4)
print(Array:toString(a)) -- 5,6,7,8,1,2,3,4
```


> #### Syntax

```lua
Array:BlockSwap(table, indexA, indexB, count)
```


> #### Parameters

**table** `Required`
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

----

&nbsp;

### Array:Concat()


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

----

&nbsp;

### Array:Entries()


The **Entries()** method returns a new Array Iterator object that contains the key/value pairs for each index in the array.


> #### Example 1: Calling the Iterator on an array

```lua
local a = {'a', 'b', 'c'}
local iterator = Array:Entries(a)
local key, val

key, val = iterator() -- 1  'a'
key, val = iterator() -- 2  'b'
key, val = iterator() -- 3  'c'
key, val = iterator() -- nil  nil
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
local iterator, tableInfo = Array:Entries(table)
```


> #### Parameters

**table** `Required`
- The table to iterate over can be array, dictionary, or mixed.


> #### Return Value

- The iterator function.

----

&nbsp;

### Array:Every()


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
local isEveryTrue, tableInfo = Array:Every(table, function, context)
```


> #### Parameters

**table** `Required`
- The table to iterate over can be array, dictionary, or mixed.

**function** `Required`
- Function to test for each element, taking up to four arguments:
    - currentValue `Required`
        - The current element being processed in the table.
    - index <kbd>Optional</kbd>
        - The index of the current element being processed in the table.
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

----

&nbsp;

### Array:Fill()


The **Fill()** method fills all the elements of an array from a start index to an end index with a static value.

Dictionary and mixed tables have unordered indices, so they are always filled from end to end.


> #### Example

```lua
local a = {1, 2, 3}

Array:Fill(a, 1)

print(Array:toString(a)) -- 1,1,1
```


> #### Syntax

```lua
Array:Fill(table, value)
Array:Fill(table, value, start)
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

----

&nbsp;

### Array:Filter()


The **Fill()** method fills all the elements of an array from a start index to an end index with a static value.

Dictionary and mixed tables have unordered indices, so they are always filled from end to end.


> #### Example

```lua
local a = {1, 2, 3}

Array:Fill(a, 1)

print(Array:toString(a)) -- 1,1,1
```


> #### Syntax

```lua
Array:Fill(table, value)
Array:Fill(table, value, start)
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

----

&nbsp;

### Array:Find()


The **Find()** method returns the value of the first element in a table that satisfies the provided testing function. Otherwise `nil` is returned.


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
        - The index of the current element being processed in the table.
    - table <kbd>Optional</kbd>
        - The table *Find* was called upon.
    - this <kbd>Optional</kbd>
        - The context to use for the *this* variable.
        - Defaults to the Array API Object.
**context** <kbd>Optional</kbd>
- Optional. Context for the *this* argument passed to *function*.


> #### Return Value

- The first value in the table that passes the test; otherwise, nil.

----



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
