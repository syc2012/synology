#$language = "VBScript"
#$interface = "1.0"


CLIENT_IP = "192.168.2.73"
SERVER_IP = "192.168.2.2"

K_IMAGE   = "DS107e_Kernel.bin"
R_IMAGE   = "DS107e_Ramdisk.bin"

K_ADDR    = "1000000"
R_ADDR    = "10d0000"


Sub main
   crt.Screen.Synchronous = True

   crt.Screen.Send "setenv serverip " + SERVER_IP & VbCr
   crt.Screen.WaitForString "_MPC824X >"
   crt.sleep 100
   crt.Screen.Send "setenv ipaddr " + CLIENT_IP & VbCr
   crt.Screen.WaitForString "_MPC824X >"
   crt.sleep 100

   '' Kernel image
   crt.Screen.Send "tftpboot " + K_ADDR + " " + K_IMAGE & VbCr
   crt.Screen.WaitForString "done"
   crt.Screen.WaitForString "_MPC824X >"
   crt.sleep 100

   '' Ramdisk image
   crt.Screen.Send "tftpboot " + R_ADDR + " " + R_IMAGE & VbCr
   crt.Screen.WaitForString "done"
   crt.Screen.WaitForString "_MPC824X >"
   crt.sleep 100

   crt.Screen.Send "bootm " + K_ADDR + " " + R_ADDR & VbCr


   crt.Screen.Synchronous = False
End Sub

