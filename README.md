# FixCraftingOrdersDisconnect
Workaround for one of the many Disconnects that can occur in 10.0.2 - this one relates to closing the Work Orders UI

If you go up to a work table, open it, switch to the work orders tab, click search then close and walk away from the table, you will disconnect from the game if you open the professions window again while not at a work table.

This appears to be because the professions window is still on the work orders tab, and the game is attempting to load in work orders details while the servers say you're not allowed to do that; you're not at a work table!

The fix here is when you've been detected searching for work orders, this micro-addon will switch you to back to the first tab when you close the window, preventing the disconnect.

Blizzard pl0x fix this :X
