from kitty.boss import Boss
from kittens.tui.handler import result_handler
import shlex

def main(args):
    pass

@result_handler(no_ui=True)
def handle_result(args, result, target_window_id, boss):
    direction = args[1]
    w = boss.active_window
    tab = boss.active_tab
    if tab:
        current_id = w.id
        current_idx = -1
        for idx, win in enumerate(tab.windows):
            if win.id == current_id:
                current_idx = idx
                break
        if current_idx == -1:
            return
        neighbor_idx = tab.current_layout.move_focused_window(tab.windows, current_idx, direction)
        if neighbor_idx != current_idx and neighbor_idx >= 0:
            neighbor = tab.windows[neighbor_idx]
            if neighbor:
                cwd = neighbor.cwd_of_child
                # Send the cwd as text to the current window
                w.paste(f"cd {shlex.quote(cwd)}\n")

