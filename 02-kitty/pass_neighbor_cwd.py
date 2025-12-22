#!/usr/bin/env python3

import sys
import shlex
from typing import List

from kitty.boss import Boss
from kittens.tui.handler import result_handler

def main(args: List[str]):
    # This function is required by the kitty kitten framework but is not used in this script.
    pass

@result_handler(no_ui=True)
def handle_result(args: List[str], answer: str, target_window_id: int, boss: Boss) -> None:
    """
    A kitten to get the CWD from a neighboring window and paste it
    into the current window.
    """
    # The first argument is the script name, the second is the direction.
    if len(args) < 2:
        return

    direction = args[1]

    # Get the window the kitten was launched from.
    source_window = boss.window_id_map.get(target_window_id)
    if source_window is None:
        return

    # --- THIS IS THE CORRECTED PART ---
    # Get the layout from the window's containing tab.
    layout = source_window.tab.layout
    # --------------------------------

    if layout is None:
        return

    # Find the neighbor in the specified direction.
    neighbor_window = layout.neighbor_for_window(source_window, direction)

    if neighbor_window:
        # Get the neighbor's current working directory.
        cwd = neighbor_window.cwd_of_child

        # Quote the path for shell safety and add a trailing space for convenience.
        text_to_paste = shlex.quote(cwd) + ' '

        # Send the text to the source window as if typed.
        boss.call_remote_control(
            source_window,
            ('send_text', {'text': text_to_paste})
        )
