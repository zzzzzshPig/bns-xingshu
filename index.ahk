global firstTap := true

resetFirstTap() {
    firstTap := true
}

global isDown := false

baofa() {
    if (isDown = false) {
        return
    }

    PixelGetColor, lingColor, 598, 405, RGB

    ; 触发灵核 - 同步触发星和tab
    ; 这里存在一种情况，当灵核触发了但是没有显示cd时候，在星，tab好的时候且 firstTap 被重置 则会触发星，tab
    if (lingColor != "0xFCFCFC" && (lingColor = "0x48DAFC" || firstTap)) {
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

    ; 普通攻击
    SendPlay, vv2244ffrrtt

    SetTimer, baofa, -15
}

clearTimer() {
    SetTimer, baofa, Off
    SetTimer, resetFirstTap, Off
}

XButton2::
    isDown := true
    clearTimer() ; 清除掉可能存在的timer，预防重复创建，也重置当前状态
    baofa()
    return

XButton2 Up::
    isDown := false
    clearTimer() ; 松开按键取消timer
    SetTimer, resetFirstTap, 6000 ; 八秒没有再次按下x2就当作第一次按
    return
