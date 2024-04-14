//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <rive_common/rive_plugin.h>
#include <win_toast/win_toast_plugin.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  RivePluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("RivePlugin"));
  WinToastPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("WinToastPlugin"));
}
