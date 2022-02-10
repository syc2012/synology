#$language = "VBScript"
#$interface = "1.0"


CLIENT_IP = "192.168.2.73"
SERVER_IP = "192.168.2.2"

K_IMAGE   = "DS107e_Kernel.bin"
R_IMAGE   = "DS107e_Ramdisk.bin"

K_ENABLE  = 0
R_ENABLE  = 0


Sub main
   crt.Screen.Synchronous = True

   crt.Screen.Send "setenv serverip " + SERVER_IP & VbCr
   crt.Screen.WaitForString "_MPC824X >"
   crt.sleep 100
   crt.Screen.Send "setenv ipaddr " + CLIENT_IP & VbCr
   crt.Screen.WaitForString "_MPC824X >"
   crt.sleep 100

   crt.Screen.Send "protect off all" & VbCr
   crt.Screen.WaitForString "_MPC824X >"
   crt.sleep 100

   If K_ENABLE Then
      crt.Screen.Send "mw.b 1000000 ff d0000" & VbCr
      crt.Screen.WaitForString "_MPC824X >"
      crt.sleep 100

      crt.Screen.Send "tftpboot 1000000 " + K_IMAGE & VbCr
      crt.Screen.WaitForString "done"
      crt.Screen.WaitForString "_MPC824X >"
      crt.sleep 100

      crt.Screen.Send "erase ffe00000 ffecffff" & VbCr
      crt.Screen.WaitForString "_MPC824X >"
      crt.sleep 100

      crt.Screen.Send "cp.b 1000000 ffe00000 d0000" & VbCr
      crt.Screen.WaitForString "_MPC824X >"
      crt.sleep 100
   End If

   If R_ENABLE Then
      crt.Screen.Send "mw.b 1000000 ff b0000" & VbCr
      crt.Screen.WaitForString "_MPC824X >"
      crt.sleep 100

      crt.Screen.Send "tftpboot 1000000 " + R_IMAGE & VbCr
      crt.Screen.WaitForString "done"
      crt.Screen.WaitForString "_MPC824X >"
      crt.sleep 100

      crt.Screen.Send "erase fff40000 fffeffff" & VbCr
      crt.Screen.WaitForString "_MPC824X >"
      crt.sleep 100

      crt.Screen.Send "cp.b 1000000 fff40000 b0000" & VbCr
      crt.Screen.WaitForString "_MPC824X >"
      crt.sleep 100
   End If

   crt.Screen.Send "protect on all" & VbCr
   crt.Screen.WaitForString "_MPC824X >"
   crt.sleep 100

   crt.Screen.Synchronous = False
End Sub

