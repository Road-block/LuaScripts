--[[
    Benediction Lua Scripts
    Creature 5202 - Archery Target
    Developed by Asura
--]]

function ATarget_Spawn(Unit)
    Unit:SetInvincible(true)
end

-- Archery Targets
RegisterUnitEvent(5202, 1,  "ATarget_Spawn")
