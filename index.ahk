global isDown := false

global can24 := false

global canV := true

setCanV() {
    canV := false
}

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
        canV := true
        SetTimer, setCanV, -42000

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
        ; 2
        PixelGetColor, 2Color, 1254, 1186, RGB
        if (2Color = "0x4F6583" || 2Color = "0x627791") {
            SendPlay, 2
        }
        
        ; 4
        PixelGetColor, 4Color, 1384, 1183, RGB
        if (4Color = "0xEDF2F8") {
            SendPlay, 4
        }
    }

    ; v
    if (canV = true) {
        PixelGetColor, vColor, 1384, 1271, RGB
        if (vColor = "0x575778") {
            SendPlay, v
        }
    }

    ; r
    PixelGetColor, rColor, 1467, 1185, RGB
    if (rColor = "0xBCE4F5") {
        SendPlay, r
    }

    ; 普通攻击
    SendPlay, ft

    SetTimer, baofa, -10
}

clearTimer() {
    SetTimer, baofa, Off
    SetTimer, setCan24, Off
    SetTimer, setCanV, off
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
