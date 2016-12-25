from Vintageous import plugins
from Vintageous.vi.cmd_defs import ViOperatorDef
from Vintageous.vi.utils import modes
from Vintageous.vi.keys import seqs
from Vintageous.vi.core import ViTextCommandBase


@plugins.register(seqs.SPACE, (modes.NORMAL,
                               modes.VISUAL,
                               modes.VISUAL_LINE,
                               modes.VISUAL_BLOCK))
class VistageousDoAll(ViOperatorDef):
    def __init__(self, *args, **kwargs):
        ViOperatorDef.__init__(self, *args, **kwargs)

        self.repeatable = False
        self.motion_required = False

    def translate(self, state):
        return {
          'action': '_vi_mark_and_move_space',
          'action_args': {},
        }


class _vi_mark_and_move_space(ViTextCommandBase):
  def __init__(self, *args, **kwargs):
    super().__init__(*args, **kwargs)

  def run(self, edit, mode=None, count=1, motion=None):
    if mode not in (modes.NORMAL,
                    modes.VISUAL,
                    modes.VISUAL_LINE,
                    modes.VISUAL_BLOCK):
        raise ValueError('bad mode: ' + mode)
    self.view.run_command('mark_and_move_do_it_all')
    self.enter_normal_mode(mode)
