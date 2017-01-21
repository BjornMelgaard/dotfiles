# import sublime

from Vintageous import plugins
from Vintageous.vi.cmd_defs import ViOperatorDef
from Vintageous.vi.utils import modes
# from Vintageous.state import State
# from Vintageous.vi.mappings import Mappings

# def plugin_unloaded():

# def plugin_loaded():
#     view = sublime.active_window().active_view()
#     state = State(view)
#     mappings = Mappings(state)

#     s_key = 's'
#     mappings.remove(modes.NORMAL, s_key)


class VintageousAceJump(ViOperatorDef):
    def __init__(self, *args, **kwargs):
        ViOperatorDef.__init__(self, *args, **kwargs)

        self.repeatable = False
        self.motion_required = False

@plugins.register('s', (modes.NORMAL, ))
class VistageousAceJumpChar(VintageousAceJump):

    def translate(self, state):
        return {
          'action': 'ace_jump_char',
          'action_args': {},
        }

# TODO:
#   - find how to unmap s action (it stored in `Vintageous.vi.keys`,
#     but remove it from here is ugly hack)
#   - make below work

# @plugins.register('ss', (modes.NORMAL,))
# class VistageousAceJumpChar(VintageousAceJump):

#     def translate(self, state):
#         return {
#           'action': 'ace_jump_char',
#           'action_args': {},
#         }


# @plugins.register('sw', (modes.NORMAL,))
# class VintageousAceJumpWord(VintageousAceJump):

#     def translate(self, state):
#         return {
#           'action': 'ace_jump_word',
#           'action_args': {},
#         }


# @plugins.register('sl', (modes.NORMAL,))
# class VintageousAceJumpLine(VintageousAceJump):

#     def translate(self, state):
#         return {
#           'action': 'ace_jump_line',
#           'action_args': {},
#         }
