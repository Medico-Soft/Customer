﻿function onTabSelecting(sender, args) {
    if (args.get_tab().get_pageViewID()) {
        args.get_tab().set_postBack(false);
    }
}