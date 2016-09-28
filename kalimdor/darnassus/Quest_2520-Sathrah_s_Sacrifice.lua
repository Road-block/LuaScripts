--[[
    Jadefire Lua Scripts
    Quest 2520 - Sathrah's Sacrifice
    Developed by Roadblock
--]]

--/*** SETUP ***/--
env = {} 
--/*** END SETUP ***/--

--/*** MODULE CODE ***/--
env.OnSpawn7411 = function(Unit)
  -- Note: a way to create custom waypoints and use :PushWaypointMovement would be nice
  -- until then, hackish way with a repeating timer.
  local sUnit = tostring(Unit)
  env[sUnit] = {}
  env[sUnit].unit = Unit
  env[sUnit].path = {}
  env.update = 2000
  env.despawn = 15000
  -- insert points in reverse order since table.remove by default works high to low array index
  -- it is also slightly more performant since it doesn't cause index shuffling
  table.insert(env[sUnit].path,{9644.415039,2522.200928,1331.671143,4.634644,false,false,false,false})
  table.insert(env[sUnit].path,{9638.921875,2532.241455,1331.610474,5.855931,false,false,false,false})
  table.insert(env[sUnit].path,{9630.022461,2531.942871,1331.402954,0.672299,false,false,false,false})
  table.insert(env[sUnit].path,{9623.474609,2525.843262,1331.635376,1.757715,false,false,false,false})
  table.insert(env[sUnit].path,{9629.181641,2515.711426,1331.625977,2.849418,false,false,false,false})
  table.insert(env[sUnit].path,{9639.617188,2517.801270,1331.534058,4.164962,false,false,false,false})  
  -- initialize a (repeating) timer
  env[sUnit].unit:CreateTimer("Step",env.update)
  env[sUnit].unit:Despawn(env.despawn,0)
end
env.AIUpdate7411 = function(Unit, mapScript, timeDiff)
  local sUnit = tostring(Unit)
  if not env[sUnit] then return end
  env[sUnit].unit = Unit
  env[sUnit].unit:UpdateTimers(timeDiff)
  if env[sUnit].unit:IsTimerFinished("Step") then
    env[sUnit].unit:ResetTimer("Step",env.update)
    local point = table.remove(env[sUnit].path)
    if point then
      env[sUnit].unit:MoveToLocation(table.unpack(point))
    else
      env[sUnit].unit:RemoveTimer("Step")
    end
  end
end
env.OnDespawn7411 = function(Unit) -- cleanup
  local sUnit = tostring(Unit)
  if not env[sUnit] then return end
  env[sUnit].unit:RemoveTimer("Step")
  env[sUnit] = {}
end
RegisterUnitEvent(7411,1,"env.OnSpawn7411") 
RegisterUnitEvent(7411,23,"env.AIUpdate7411")
RegisterUnitEvent(7411,2,"env.OnDespawn7411")
--/*** END MODULE CODE ***/--