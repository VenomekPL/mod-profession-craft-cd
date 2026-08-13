-- Salt Shaker (item 15846, spell 19566): keep the 3-day CD off.
-- Stock 3.3.5 already has no Spell.dbc CD (removed in 3.1). Individual Progression
-- optional zz_optional_restore_crafting_cd_timers.sql puts 259200000 ms back on
-- item_template — this zeros that restore and pins a spell override.
-- Reload: restart worldserver (item_template + spell_cooldown_overrides load at startup).

UPDATE `item_template`
SET `spellcooldown_1` = 0,
    `spellcategorycooldown_1` = 0
WHERE `entry` = 15846;

DELETE FROM `spell_cooldown_overrides` WHERE `Id` = 19566;
INSERT INTO `spell_cooldown_overrides`
    (`Id`, `RecoveryTime`, `CategoryRecoveryTime`, `StartRecoveryTime`, `StartRecoveryCategory`, `Comment`)
VALUES
    (19566, 0, 0, 0, 0, 'Profession craft CD removed - Salt Shaker');
