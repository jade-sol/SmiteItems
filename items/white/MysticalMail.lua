-- Smite Items: Mystical Mail
-- Deal damage around the player every second.

-- Basic Configuration
local sprite = Resources.sprite_load("SmiteItems", "item/MysticalMail", PATH.."assets/sprites/items/MysticalMail.png", 1, 16, 16)

local item = Item.new("SmiteItems", "MysticalMail")
item:set_sprite(sprite)
item:set_tier(Item.TIER.common)
item:set_loot_tags(Item.LOOT_TAG.category_damage)

item:toggle_loot(true)
item:clear_callbacks()

-- Main Function
item:onAcquire(function(actor, stack)
    Alarm.create(mystical_damage, 60, stack)
end)

local function mystical_damage(stack)
    local cloud = GM.instance_create(actor.x, actor.y, gm.constants.onMushDust)
    cloud.parent = actor
    cloud.team   = actor.team
    cloud.damage = 12 + (stack * (actor.level * 3))
    cloud:alarm_set(0, 60)
    Alarm.create(mystical_damage, 60, stack)
end