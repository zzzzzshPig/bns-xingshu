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
        ;触发星
        PixelGetColor, xingColor, 750, 884, RGB
        if (xingColor = "0xD6C4B1") {
            Send ``
        }

        ;触发tab 
        PixelGetColor, tabColor, 1099, 1204, RGB
        if (tabColor = "0xA5AAD6") {
            Send {Tab}
        }
    }

    if (can24 = true) {
        SendPlay, 2244
    }

    ; 普通攻击
    SendPlay, vvffrrtt

    SetTimer, baofa, -10
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
