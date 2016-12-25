from Vintageous import plugins
from Vintageous.vi.cmd_defs import ViOperatorDef
from Vintageous.vi.utils import modes
from VintageousOrigami.action_cmds import VintageousOrigamiBase


@plugins.register('<C-w><C-w>', (modes.NORMAL,))
class VintageousOrigamiClose(VintageousOrigamiBase):
    def translate(self, state):
        return {
            'action': 'close',
            'action_args': {}
        }
