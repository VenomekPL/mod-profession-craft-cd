-- Remove Classic / TBC / WotLK profession craft spell cooldowns.
-- Reload: restart worldserver (spell_cooldown_overrides load at startup).
-- Scope: TRADE craft spells. Salt Shaker is in 2026_08_13_00_*.sql
--        (item_template + spell 19566). Does not touch Wormhole gadget
--        uses, hearthstones, potions, or combat CDs.

DELETE FROM `spell_cooldown_overrides` WHERE `Id` IN (
    -- Classic tailoring / alchemy (often already 0 in 3.3.5 DBC; force zero vs IP restore)
    18560,  -- Mooncloth
    17187,  -- Transmute: Arcanite
    25146,  -- Transmute: Elemental Fire
    11479,  -- Transmute: Iron to Gold
    11480,  -- Transmute: Mithril to Truesilver
    17559,  -- Transmute: Air to Fire
    17560,  -- Transmute: Fire to Earth
    17561,  -- Transmute: Earth to Water
    17562,  -- Transmute: Water to Air
    17563,  -- Transmute: Undeath to Water
    17564,  -- Transmute: Water to Undeath
    17565,  -- Transmute: Life to Earth
    17566,  -- Transmute: Earth to Life
    -- TBC specialty cloth + alchemy
    26751,  -- Primal Mooncloth
    31373,  -- Spellcloth
    36686,  -- Shadowcloth
    29688,  -- Transmute: Primal Might
    32765,  -- Transmute: Earthstorm Diamond
    32766,  -- Transmute: Skyfire Diamond
    28566,  -- Transmute: Primal Air to Fire
    28567,  -- Transmute: Primal Earth to Water
    28568,  -- Transmute: Primal Fire to Earth
    28569,  -- Transmute: Primal Water to Air
    28580,  -- Transmute: Primal Shadow to Water
    28581,  -- Transmute: Primal Water to Shadow
    28582,  -- Transmute: Primal Mana to Fire
    28583,  -- Transmute: Primal Fire to Mana
    28584,  -- Transmute: Primal Life to Earth
    28585,  -- Transmute: Primal Earth to Life
    -- WotLK alchemy (stock DBC category-310 / research)
    53771,  -- Transmute: Eternal Life to Shadow
    53773,  -- Transmute: Eternal Life to Fire
    53774,  -- Transmute: Eternal Fire to Water
    53775,  -- Transmute: Eternal Fire to Life
    53776,  -- Transmute: Eternal Air to Water
    53777,  -- Transmute: Eternal Air to Earth
    53779,  -- Transmute: Eternal Shadow to Earth
    53780,  -- Transmute: Eternal Shadow to Life
    53781,  -- Transmute: Eternal Earth to Air
    53782,  -- Transmute: Eternal Earth to Shadow
    53783,  -- Transmute: Eternal Water to Air
    53784,  -- Transmute: Eternal Water to Fire
    54020,  -- Transmute: Eternal Might
    66658,  -- Transmute: Ametrine
    66659,  -- Transmute: Cardinal Ruby
    66660,  -- Transmute: King's Amber
    66662,  -- Transmute: Dreadstone
    66663,  -- Transmute: Majestic Zircon
    66664,  -- Transmute: Eye of Zul
    60893,  -- Northrend Alchemy Research
    -- WotLK inscription / JC / enchanting / tailoring
    61288,  -- Minor Inscription Research
    61177,  -- Northrend Inscription Research
    47280,  -- Brilliant Glass
    62242,  -- Icy Prism
    28027,  -- Prismatic Sphere
    28028,  -- Void Sphere
    56005   -- Glacial Bag
);

INSERT INTO `spell_cooldown_overrides`
    (`Id`, `RecoveryTime`, `CategoryRecoveryTime`, `StartRecoveryTime`, `StartRecoveryCategory`, `Comment`)
VALUES
    -- Classic
    (18560, 0, 0, 0, 0, 'Profession craft CD removed - Mooncloth'),
    (17187, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Arcanite'),
    (25146, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Elemental Fire'),
    (11479, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Iron to Gold'),
    (11480, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Mithril to Truesilver'),
    (17559, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Air to Fire'),
    (17560, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Fire to Earth'),
    (17561, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Earth to Water'),
    (17562, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Water to Air'),
    (17563, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Undeath to Water'),
    (17564, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Water to Undeath'),
    (17565, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Life to Earth'),
    (17566, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Earth to Life'),
    -- TBC
    (26751, 0, 0, 0, 0, 'Profession craft CD removed - Primal Mooncloth'),
    (31373, 0, 0, 0, 0, 'Profession craft CD removed - Spellcloth'),
    (36686, 0, 0, 0, 0, 'Profession craft CD removed - Shadowcloth'),
    (29688, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Primal Might'),
    (32765, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Earthstorm Diamond'),
    (32766, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Skyfire Diamond'),
    (28566, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Primal Air to Fire'),
    (28567, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Primal Earth to Water'),
    (28568, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Primal Fire to Earth'),
    (28569, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Primal Water to Air'),
    (28580, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Primal Shadow to Water'),
    (28581, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Primal Water to Shadow'),
    (28582, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Primal Mana to Fire'),
    (28583, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Primal Fire to Mana'),
    (28584, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Primal Life to Earth'),
    (28585, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Primal Earth to Life'),
    -- WotLK
    (53771, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Eternal Life to Shadow'),
    (53773, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Eternal Life to Fire'),
    (53774, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Eternal Fire to Water'),
    (53775, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Eternal Fire to Life'),
    (53776, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Eternal Air to Water'),
    (53777, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Eternal Air to Earth'),
    (53779, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Eternal Shadow to Earth'),
    (53780, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Eternal Shadow to Life'),
    (53781, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Eternal Earth to Air'),
    (53782, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Eternal Earth to Shadow'),
    (53783, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Eternal Water to Air'),
    (53784, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Eternal Water to Fire'),
    (54020, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Eternal Might'),
    (66658, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Ametrine'),
    (66659, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Cardinal Ruby'),
    (66660, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: King''s Amber'),
    (66662, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Dreadstone'),
    (66663, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Majestic Zircon'),
    (66664, 0, 0, 0, 0, 'Profession craft CD removed - Transmute: Eye of Zul'),
    (60893, 0, 0, 0, 0, 'Profession craft CD removed - Northrend Alchemy Research'),
    (61288, 0, 0, 0, 0, 'Profession craft CD removed - Minor Inscription Research'),
    (61177, 0, 0, 0, 0, 'Profession craft CD removed - Northrend Inscription Research'),
    (47280, 0, 0, 0, 0, 'Profession craft CD removed - Brilliant Glass'),
    (62242, 0, 0, 0, 0, 'Profession craft CD removed - Icy Prism'),
    (28027, 0, 0, 0, 0, 'Profession craft CD removed - Prismatic Sphere'),
    (28028, 0, 0, 0, 0, 'Profession craft CD removed - Void Sphere'),
    (56005, 0, 0, 0, 0, 'Profession craft CD removed - Glacial Bag');
