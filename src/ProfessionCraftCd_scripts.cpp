#include "AllSpellScript.h"
#include "Config.h"
#include "Log.h"
#include "ObjectAccessor.h"
#include "Player.h"
#include "ScriptMgr.h"
#include "SpellInfo.h"
#include "SpellMgr.h"

class ProfessionCraftCd_World : public WorldScript
{
public:
    ProfessionCraftCd_World() : WorldScript("ProfessionCraftCd_World") { }

    void OnAfterConfigLoad(bool /*reload*/) override
    {
        if (sConfigMgr->GetOption<bool>("ProfessionCraftCd.Enabled", true))
            LOG_INFO("server.loading",
                "ProfessionCraftCd: module present (profession craft cooldowns from spell_cooldown_overrides)");
    }
};

class ProfessionCraftCd_AllSpell : public AllSpellScript
{
public:
    ProfessionCraftCd_AllSpell() : AllSpellScript("ProfessionCraftCd_AllSpell", { ALLSPELLHOOK_ON_CAST }) { }

    void OnSpellCast(Spell* /*spell*/, Unit* caster, SpellInfo const* spellInfo, bool /*skipCheck*/) override
    {
        if (!sConfigMgr->GetOption<bool>("ProfessionCraftCd.Enabled", true))
            return;
        if (!caster || !caster->IsPlayer() || !spellInfo)
            return;
        if (!sSpellMgr->HasSpellCooldownOverride(spellInfo->Id))
            return;

        Player* player = caster->ToPlayer();
        player->SendSpellCooldownOverrideToClient(spellInfo);

        // SPELL_GO makes the client start Spell.dbc CD; push again after that apply.
        ObjectGuid const guid = player->GetGUID();
        uint32 const spellId = spellInfo->Id;
        player->m_Events.AddEventAtOffset([guid, spellId]()
        {
            Player* p = ObjectAccessor::FindConnectedPlayer(guid);
            if (!p)
                return;
            if (SpellInfo const* info = sSpellMgr->GetSpellInfo(spellId))
                p->SendSpellCooldownOverrideToClient(info);
        }, 150ms);
    }
};

void AddProfessionCraftCdScripts()
{
    new ProfessionCraftCd_World();
    new ProfessionCraftCd_AllSpell();
}
