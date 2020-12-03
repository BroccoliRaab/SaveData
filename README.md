# READ THIS
I wrote this a few years back now and have noticed that it still gets used occasionally. It should work fine, just know that then way I decided to do this makes it extremely trivial to inject lua code into your games from the savefile. Thats what this script does as the savefile is infact just a lua script that returns the table.

# SaveData
A Library for Love2D for saving data

# Usage
This library is capable of saving most tables into a file to be loaded back in at a later timer.

```saveData.save(data, saveFile)``` 

This will save the Table, ```data``` into a file named ```saveFile``` overwriting it if it exists and creating it if it does not.  

This will return the ```success``` and ```error``` values of the ```love.filesystem.write``` function


```saveData.load(saveFile)``` 

This will return the table saved in the file named ```saveFile```

# Example
``` 
local saveData = require("saveData")
function love.load()
t = {}
t.settings = {graphics = "good"}
t.settings.window = {x = 10, y = 20}
t.save = {}
t.save.scene = "boss"

saveData.save(t, "test")

local t2 = saveData.load("test")
print(t2.settings.graphics)
print(t2.settings.window.x, t2.settings.window.y)
print(t2.save.scene)
end
```

OUTPUT:
```
good
10  20
boss
```
