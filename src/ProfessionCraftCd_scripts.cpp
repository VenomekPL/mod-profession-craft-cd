#include "ScriptMgr.h"
#include "Config.h"
#include "Log.h"

class ProfessionCraftCd_World : public WorldScript
{
public:
    ProfessionCraftCd_World() : WorldScript("ProfessionCraftCd_World") { }

    void OnAfterConfigLoad(bool /*reload*/) override
    {
        if (sConfigMgr->GetOption<bool>("ProfessionCraftCd.Enabled", true))
            LOG_INFO("server.loading",
                "ProfessionCraftCd: module present (profession craft cooldowns removed via SQL)");
    }
};

void AddProfessionCraftCdScripts()
{
    new ProfessionCraftCd_World();
}
