global firstTap := true

resetFirstTap() {
    firstTap := true
}

baofa() {
    PixelGetColor, lingColor, 598, 405, RGB

    ; 触发灵核 - 同步触发星和tab 
    if (lingColor = "0x48DAFC" || firstTap) {
        While (true) {
            PixelGetColor, xingColor, 750, 884, RGB
            PixelGetColor, tabColor, 1099, 1204, RGB

            ; 触发星和tab
            if (xingColor = "0xD6C4B1" || tabColor = "0xA5AAD6") {
                Send ``{Tab}
            } else { ; 已经触发则跳出while
                break
            }
        }
    }

    firstTap := false

    ;触发v
    PixelGetColor, vColor, 1377, 1284, RGB
    if (vColor = "0x68C1E5") {
        SendPlay, vv
    }

    ;触发2
    PixelGetColor, 2Color, 1249, 1199, RGB
    if (2Color = "0x78EAFF" || 2Color = "0x5672A2") {
        SendPlay, 22
    }

    ;触发4
    PixelGetColor, 4Color, 1384, 1200, RGB
    if (4Color = "0x4886CE") {
        SendPlay, 44
    }

    ;触发f
    SendPlay, ff

    ;触发r
    PixelGetColor, rColor, 1465, 1197, RGB
    if (rColor = "0xFEFFFF") {
        SendPlay, rr
    }

    ;触发t
    SendPlay, tt
}

clearTimer() {
    SetTimer, baofa, Off
    SetTimer, resetFirstTap, Off
}

XButton2::
    clearTimer() ; 清除掉可能存在的timer，预防重复创建，也重置当前状态
    ; 开始输出
    SetTimer, baofa, 15
    return

XButton2 Up::
    clearTimer() ; 松开按键取消timer
    SetTimer, resetFirstTap, 6000 ; 八秒没有再次按下x2就当作第一次按
    return
