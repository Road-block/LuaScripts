--[[
    Jadefire Lua Scripts
    Quest 931 - The Shimmering Frond
    Developed by Roadblock
--]]

--/*** SETUP ***/--
env = {} 
--/*** END SETUP ***/--

--/*** MODULE CODE ***/--
env.OnConcludeQuest2080 = function(Unit, QuestId, Player)
  if not QuestId == 931 then return end
  local sUnit = tostring(Unit)
  local sPlayer = tostring(Player)
  --error(sPlayer .. ", " .. sUnit)
  env[sUnit],env[sPlayer] = {},{}
  env[sUnit].unit,env[sPlayer].player = Unit,Player
  env.update = 10000
  env[sUnit].unit:CreateTimer("Step",env.update)
  env[sUnit].unit:MoveToLocation(9506.529297,720.464233,1256.142212,2.654644,false,false,false,false)
end
env.AIUpdate2080 = function(Unit, mapScript, timeDiff)
  local sUnit = tostring(Unit)
  if not env[sUnit] then return end
  env[sUnit].unit = Unit
  env[sUnit].unit:UpdateTimers(timeDiff)
  if env[sUnit].unit:IsTimerFinished("Step") then
    env[sUnit].unit:RemoveTimer("Step")
    RegisterGameObjectEvent(7510,1,"env.OnGameObjectSpawn7510")
    env[sUnit].unit:SpawnGameObjectAtObject(7510, 7923, 0.5)
    --env[sUnit].unit:MoveToLocation(table.unpack(env[sUnit].startPos))
    env[sUnit].unit:MoveHome() -- undocumented?
  end
end
env.OnGameObjectSpawn7510 = function(GO)
  local sGO = tostring(GO)
  env[sGO] = {}
  env[sGO].go = GO
  -- env[sGO].go:SetState(1)
  RegisterGameObjectEvent(7510,23,"env.AIUpdate7510")
  env[sGO].go:CreateTimer("Expire",30000)
end
env.AIUpdate7510 = function(GO, mapScript, timeDiff)
  local sGO = tostring(GO)
  if not env[sGO] then return end
  env[sGO].go = GO
  env[sGO].go:UpdateTimers(timeDiff)
  if env[sGO].go:IsTimerFinished("Expire") then
    env[sGO].go:RemoveTimer("Expire")
    env[sGO].go:Despawn(1,0)
  end
end
RegisterUnitEvent(2080,17,"env.OnConcludeQuest2080")
RegisterUnitEvent(2080,23,"env.AIUpdate2080")
--/*** END MODULE CODE ***/--