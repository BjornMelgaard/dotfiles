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
        cmd = {}
        cmd['action'] = '_vi_mark_and_move_space'
        cmd['action_args'] = {
            'mode': state.mode,
        }
        return cmd


class _vi_mark_and_move_space(ViTextCommandBase):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

    def run(self, edit, mode=None):
        if mode not in (modes.INTERNAL_NORMAL,
                        modes.VISUAL,
                        modes.VISUAL_LINE,
                        modes.VISUAL_BLOCK):
            raise ValueError('bad mode: ' + mode)

        mark_and_move_marks = self.view.get_regions('mark_and_move')

        def region_in(region, marks):
            for mark in marks:
                if mark.contains(region):
                    return True
            return False

        if any(not region_in(region, mark_and_move_marks) for region in self.view.sel()):
            self.view.run_command('mark_and_move_save')
            self.enter_normal_mode(mode)
        else:
            self.view.run_command('mark_and_move_recall', {"clear": True})
