import sublime
import sublime_plugin


class NerdTreeCommand(sublime_plugin.WindowCommand):
    def run(self):
        was_visible = self.window.is_sidebar_visible()
        self.window.run_command("toggle_side_bar")
        if was_visible:
            self.window.run_command("focus_group", {"group": 0})
        else:
            self.window.run_command("focus_side_bar")
