global isDown := false

global can24 := false

setCan24() {
    can24 := true
}

attack() {
    if (isDown = false) {
        return
    }

    ;灵核触发
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

    ;触发t
    SendPlay, t

    ;触发v
    PixelGetColor, vColor, 1377, 1284, RGB
    if (vColor = "0x68C1E5") {
        SendPlay, v
    }

    ;触发f
    SendPlay, f

    ;触发r
    PixelGetColor, rColor, 1465, 1197, RGB
    if (rColor = "0xFEFFFF") {
        SendPlay, r
    }
    
    if (can24 = false) {
        return
    }

    ;触发2
    PixelGetColor, 2Color, 1249, 1199, RGB
    if (2Color = "0x78EAFF" || 2Color = "0x5672A2") {
        SendPlay, 2
    }

    ;触发4
    PixelGetColor, 4Color, 1384, 1200, RGB
    if (4Color = "0x4886CE") {
        SendPlay, 4
    }
}

clearTimer() {
    SetTimer, attack, Off
    SetTimer, setCan24, Off
}

XButton2::
    isDown := true
    can24 := false
    clearTimer() ; 清除掉可能存在的timer，预防重复创建
    SetTimer, setCan24, -1000
    ; 开始输出
    SetTimer, attack, 10
    return

XButton2 Up::
    isDown := false
    clearTimer() ; 松开按键取消timer
    return
