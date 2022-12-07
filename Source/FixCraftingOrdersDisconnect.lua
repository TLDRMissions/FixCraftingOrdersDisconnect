-- If you go up to a work table, open it, switch to the work orders tab, click search
-- then close and walk away from the table, you will disconnect from the game if you
-- open the professions window again while not at a work table.

-- This appears to be because the professions window is still on the work orders tab,
-- and the game is attempting to load in work orders details while the servers say
-- you're not allowed to do that; you're not at a work table!

-- The fix here is when you've been detected searching for work orders, this micro-addon
-- will switch you to back to the first tab when you close the window, preventing the
-- disconnect.

if GetBuildInfo() ~= "10.0.2" then return end -- hopefully Blizzard fixes this next patch so we don't need this anymore :x 

local f = CreateFrame("Frame")
f:RegisterEvent("TRADE_SKILL_CLOSE")
local shouldChange
f:SetScript("OnEvent", function(self, event, name, ...)
    if (event == "TRADE_SKILL_CLOSE") then
        if shouldChange then
            ProfessionsFrame.TabSystem:GetTabButton(1):Click()
            shouldChange = nil
        end
    end
end)

ProfessionsFrame.TabSystem:GetTabButton(1):HookScript("OnClick", function()
    shouldChange = nil
end)

ProfessionsFrame.TabSystem:GetTabButton(2):HookScript("OnClick", function()
    shouldChange = nil
end)

ProfessionsFrame.OrdersPage.BrowseFrame.SearchButton:HookScript("OnClick", function()
    shouldChange = true
end)