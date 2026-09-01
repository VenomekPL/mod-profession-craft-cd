# mod-profession-craft-cd

Removes **profession craft** cooldowns for Classic, TBC, and WotLK recipes
(Mooncloth, Arcanite, specialty cloths, alchemy transmutes/research, inscription
research, JC prisms, enchanting spheres, Glacial Bag, **Salt Shaker**, etc.).

## Purpose / scope

| Layer | Role |
|-------|------|
| Module SQL | Sets `spell_cooldown_overrides` RecoveryTime / CategoryRecoveryTime to **0** for allowlisted craft spells; zeros Salt Shaker `item_template` CDs |
| `ProfessionCraftCd.Enabled` | Documents intent; logs at worldserver load |
| Core `SkillGain.Crafting = 3` | Companion skill-up rate — set in `worldserver.conf` (not this module) |

**Does not** change:

- Wormhole / engineering gadget uses
- Hearthstone, potions, combat spells
- Gathering professions

After a successful craft the 3.3.5 client still starts the **Spell.dbc** timer
unless the server pushes `SMSG_SPELL_COOLDOWN` from `spell_cooldown_overrides`
(same pattern as hearthstone). Core + this module send a 1 ms packet plus
`SMSG_CLEAR_COOLDOWN` for category 310 siblings so the client adopts the
database CD. Optional:
`scripts/patch-profession-craft-dbc.sh` + clear `Cache/` so tooltips match.

## Allowlist (summary)

- **Classic:** Mooncloth, Transmute Arcanite / Elemental Fire, and period transmutes; Salt Shaker (item 15846 / spell 19566)
- **TBC:** Primal Mooncloth / Spellcloth / Shadowcloth; Primal Might; Earthstorm / Skyfire diamonds; primal elemental transmutes
- **WotLK (still CD in stock 3.3.5 DBC):** Alchemy category-310 transmutes + Eternal Might + epic gem transmutes; Northrend Alchemy Research; Minor / Northrend Inscription Research; Brilliant Glass / Icy Prism; Prismatic / Void Sphere; Glacial Bag

Moonshroud / Ebonweave / Spellweave are already zero in stock 3.3.5 DBC.

Also forces Classic/TBC historical crafts (and Salt Shaker item CDs) to zero so
optional Individual Progression `zz_optional_restore_crafting_cd_timers.sql`
cannot re-enable them if applied.

## Configuration

See `conf/professionCraftCd.conf.dist`:

| Key | Default | Meaning |
|-----|---------|---------|
| `ProfessionCraftCd.Enabled` | 1 | Log module presence |

## Install

```bash
cd modules
git submodule add https://github.com/VenomekPL/mod-profession-craft-cd.git mod-profession-craft-cd
```

Companion core setting:

```
SkillGain.Crafting = 3
```

Reload: apply module world SQL (worldserver updater), then **restart** worldserver
(`spell_cooldown_overrides` and `item_template` load at startup).

## License

MIT (AzerothCore module skeleton)
