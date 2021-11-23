global isDown := false

global can24 := false

setCan24() {
    can24 := true
}

baofa() {
    if (isDown = false) {
        return
    }

    ; 触发灵核 - 同步触发星和tab
    PixelGetColor, lingColor, 598, 405, RGB
    if (lingColor = "0x48DAFC") {
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

    if (can24 = true) {
        SendPlay, 2244
    }

    ; 普通攻击
    SendPlay, vvffrrtt

    SetTimer, baofa, -15
}

clearTimer() {
    SetTimer, baofa, Off
    SetTimer, setCan24, Off
}

XButton2::
    isDown := true
    can24 := false
    clearTimer() ; 清除掉可能存在的timer，预防重复创建
    SetTimer, setCan24, -1000
    baofa()
    return

XButton2 Up::
    isDown := false
    clearTimer() ; 松开按键取消timer
    return
