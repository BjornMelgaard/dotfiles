from Vintageous import plugins
from Vintageous.vi.cmd_defs import ViOperatorDef
from Vintageous.vi.utils import modes
from Vintageous.vi.keys import seqs
from Vintageous.vi.core import ViTextCommandBase
from Vintageous.vi.cmd_defs import _MODES_ACTION


@plugins.register("<M-d>", _MODES_ACTION)
class ViClipboardCut(ViOperatorDef):

    def __init__(self, *args, **kwargs):
        ViOperatorDef.__init__(self, *args, **kwargs)
        self.updates_xpos = True
        self.scroll_into_view = True
        self.motion_required = True
        self.repeatable = True

    def translate(self, state):
        cmd = {}
        cmd['action'] = '_vi_d'
        cmd['action_args'] = {'mode': state.mode,
                              'count': state.count,
                              'register':  "+",
                              }

        return cmd


@plugins.register("<M-y>", _MODES_ACTION)
class ViClipboardCopy(ViOperatorDef):

    def __init__(self, *args, **kwargs):
        ViOperatorDef.__init__(self, *args, **kwargs)
        self.updates_xpos = True
        self.scroll_into_view = True
        self.repeatable = True

    def translate(self, state):
        cmd = {}
        cmd['action'] = '_vi_y'
        cmd['action_args'] = {'mode': state.mode,
                              'count': state.count,
                              'register':  "+",
                              }

        return cmd


@plugins.register("<M-p>", _MODES_ACTION)
class ViClipboardPasteAfter(ViOperatorDef):

    def __init__(self, *args, **kwargs):
        ViOperatorDef.__init__(self, *args, **kwargs)
        self.updates_xpos = True
        self.scroll_into_view = True
        self.repeatable = True

    def translate(self, state):
        cmd = {}
        cmd['action'] = '_vi_p'
        cmd['action_args'] = {'mode': state.mode,
                              'count': state.count,
                              'register': "+",
                              }

        return cmd


@plugins.register("<M-P>", _MODES_ACTION)
class ViClipboardPasteBefore(ViOperatorDef):

    def __init__(self, *args, **kwargs):
        ViOperatorDef.__init__(self, *args, **kwargs)
        self.updates_xpos = True
        self.scroll_into_view = True
        self.repeatable = True

    def translate(self, state):
        cmd = {}
        cmd['action'] = '_vi_big_p'
        cmd['action_args'] = {'mode': state.mode,
                              'count': state.count,
                              'register': "+",
                              }

        return cmd
