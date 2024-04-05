local mod = RegisterMod("Doener", 1)
-- Collectible Initialization
mod.COLLECTIBLE_DOENER = Isaac.GetItemIdByName("Doener")
-- Function to trigger ToxicAura while firering
    local function ToxicAura(self, Aura)
        -- Get the Player and put it into the "player" variable
        local player = Isaac.GetPlayer()
        -- If the player has the "Doener" collectible item then
        if player:HasCollectible(mod.COLLECTIBLE_DOENER) then
            --Get the entity, which is an effect, "FART_RING", which has no subvariant. Spawn the entity at the players position with an offset of 20 to match the characters middle. The FART_RING gets NO velocity
            BadBreath = Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.FART_RING, 0, Vector(player.Position.X, player.Position.Y-20), Vector(0,0), nil)
            --Converting the Entity FART_RING to an EntityEffect
            BadBreathEffect = BadBreath:ToEffect()
            --Letting the FART_RING follow the characters movement
            BadBreathEffect:FollowParent(player)
            --Letting the FART_RING decay over a period of 60 frames
            BadBreathEffect:SetTimeout(60)
        else
            --Do nothing
        end
    end
--If the Player fires a tear, the function "ToxicAura" gets called
mod:AddCallback(ModCallbacks.MC_POST_TEAR_INIT, ToxicAura)
