--[[
    Benediction Lua Scripts
    Gameobject 178090 - Marla's Grave
    Developed by Asura

    Quest 6395: Marla's Last Wish
--]]

function MarlaGrave_OnActivate(Object, Player)
    if Player:HasQuest(6395) then
        local Quest = Player:GetQuestLogEntry(6395)
        if Quest ~= nil then
            if Quest:CanBeFinished() ~= nil then
                Quest:AddSpecialUpdate(0, Player:GetGuid())
                Quest:UpdatePlayerFields()
            end
        end
    end
end

RegisterGameObjectEvent(178090, 3, "MarlaGrave_OnActivate")

