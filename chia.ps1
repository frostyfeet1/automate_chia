$start = 1
for() {


if($start -eq 1){
start powershell {"C:\Users\Ploter02\Desktop\F1.ps1"}
start-sleep -s 60
$prvi = tasklist | Select-String -CaseSensitive -SimpleMatch chia  | select-object -First 1|Foreach {"$(($_ -split '\s+',4)[1..1])"}
echo $prvi
}
else{
start powershell {"C:\Users\Ploter02\Desktop\F1.ps1"}
start-sleep -s 60
$prvi = tasklist | Select-String -CaseSensitive -SimpleMatch chia  | Select-String -NotMatch $drugi | Select-String -NotMatch $treci | Select-String -NotMatch $peti | Select-String -NotMatch $cetvrti | Select-String -NotMatch $sesti | select-object -First 1 |Foreach {"$(($_ -split '\s+',4)[1..1])"}
echo $prvi

}



if ($start -eq 1)
{ 
  start-sleep -s 2400
  
  start powershell {"C:\Users\Ploter02\Desktop\F2.ps1"}
start-sleep -s 2400
 
  $drugi = tasklist | Select-String -CaseSensitive -SimpleMatch chia  |Select-String -notmatch $prvi| select-object -First 1 |Foreach {"$(($_ -split '\s+',4)[1..1])"}
}

else{
 $test2 = [System.Convert]::ToInt32($drugi,10)
 $nerad2 = Get-Process -Id $test2 -ErrorAction SilentlyContinue
echo "[*] waiting for 2nd plot to finish"
  
    while (!($nerad2 -eq $null)) {
    $nerad2 = Get-Process -Id $test2 -ErrorAction SilentlyContinue
   
    
    }

echo "[*] Plot 2 ended starting again"
start powershell {"C:\Users\Ploter02\Desktop\F2.ps1"}
start-sleep -s 60
$drugi = tasklist | Select-String -CaseSensitive -SimpleMatch chia   | Select-String -notmatch $prvi | Select-String -notmatch $treci |Select-String -notmatch $cetvrti |Select-String -notmatch $sesti| Select-String -notmatch $peti | Select-Object -First 1 |Foreach {"$(($_ -split '\s+',4)[1..1])"}
}

echo "2nd process is $drugi"
if ($start -eq 1)
{ 
start-sleep -s 2400
start powershell {"C:\Users\Ploter02\Desktop\F3.ps1"}
start-sleep -s 60
$treci = tasklist | Select-String -CaseSensitive -SimpleMatch chia   | Select-String -notmatch $prvi | Select-String -NotMatch $drugi  | Select-Object -First 1 |Foreach {"$(($_ -split '\s+',4)[1..1])"}
}
else{
 $test3 = [System.Convert]::ToInt32($treci,10)
 $nerad3 = Get-Process -Id $test3 -ErrorAction SilentlyContinue
echo "[*] waiting for 3rd plot to finish"
  
    while (!($nerad3 -eq $null)) {
    $nerad3 = Get-Process -Id $test3 -ErrorAction SilentlyContinue
    
    }

echo "[*] Plot 3 ended starting again"
start powershell {"C:\Users\Ploter02\Desktop\F3.ps1"}
start-sleep -s 60
$treci = tasklist | Select-String -CaseSensitive -SimpleMatch chia   | Select-String -notmatch $prvi | Select-String -NotMatch $drugi | Select-String -notmatch $cetvrti | Select-String -notmatch $peti|  Select-String -NotMatch $sesti | Select-Object -First 1|Foreach {"$(($_ -split '\s+',4)[1..1])"}
}



echo "3rd process is:$treci"

if ($start -eq 1)
{ 
start-sleep -s 2400

start powershell {"C:\Users\Ploter02\Desktop\G1.ps1"}
start-sleep -s 60
$cetvrti = tasklist | Select-String -CaseSensitive -SimpleMatch chia   | Select-String -notmatch $prvi | Select-String -NotMatch $drugi | Select-String -NotMatch $treci|   Select-Object -First 1 |Foreach {"$(($_ -split '\s+',4)[1..1])"}
echo $cetvrti
}
else{
 $test4 = [System.Convert]::ToInt32($cetvrti,10)
 $nerad4 = Get-Process -Id $test4 -ErrorAction SilentlyContinue
echo "[*] ceka se da 4 plot zavrsi"
  
    while (!($nerad4 -eq $null)) {
    $nerad4 = Get-Process -Id $test4 -ErrorAction SilentlyContinue
   
    
    }

echo "[*] Plot 4 ended,startin again"
start powershell {"C:\Users\Ploter02\Desktop\G1.ps1"}
start-sleep -s 60
$cetvrti = tasklist | Select-String -CaseSensitive -SimpleMatch chia  | Select-String -notmatch $prvi | Select-String -NotMatch $drugi | Select-String -NotMatch $treci|  Select-String -NotMatch $peti | Select-String -NotMatch $sesti | Select-Object -First 1  |Foreach {"$(($_ -split '\s+',4)[1..1])"}
}

echo "4th process is : $cetvrti"

if ($start -eq 1)
{ 
start-sleep -s 2400

start powershell {"C:\Users\Ploter02\Desktop\G2.ps1"}
start-sleep -s 60
$peti = tasklist | Select-String -CaseSensitive -SimpleMatch chia   | Select-String -notmatch $prvi | Select-String -NotMatch $drugi | Select-String -NotMatch $treci | Select-String -NotMatch $cetvrti | Select-Object -First 1|Foreach {"$(($_ -split '\s+',4)[1..1])"}
}
else{
 $test5 = [System.Convert]::ToInt32($peti,10)
 $nerad5 = Get-Process -Id $test5 -ErrorAction SilentlyContinue
echo "[*] waiting for 5th plot to finish"
  
    while (!($nerad5 -eq $null)) {
    $nerad5 = Get-Process -Id $test5 -ErrorAction SilentlyContinue
    
    
    }

echo "[*] Plot 5 ended startin it again"
start powershell {"C:\Users\Ploter02\Desktop\G2.ps1"}
start-sleep -s 60
$peti = tasklist | Select-String -CaseSensitive -SimpleMatch chia   | Select-String -notmatch $prvi | Select-String -NotMatch $drugi | Select-String -NotMatch $treci | Select-String -NotMatch $cetvrti| Select-String -NotMatch $sesti | Select-Object -First 1 |Foreach {"$(($_ -split '\s+',4)[1..1])"}
}

echo "5 process is : $peti"

if ($start -eq 1)
{ 
start-sleep -s 2400

start powershell {"C:\Users\Ploter02\Desktop\G3.ps1"}
start-sleep -s 60
$sesti = tasklist | Select-String -CaseSensitive -SimpleMatch chia  | Select-String -notmatch $prvi | Select-String -NotMatch $drugi | Select-String -NotMatch $treci | Select-String -NotMatch $peti | Select-String -NotMatch $cetvrti | Select-Object -First 1|Foreach {"$(($_ -split '\s+',4)[1..1])"}
}
else{
 $test6 = [System.Convert]::ToInt32($sesti,10)
 $nerad6 = Get-Process -Id $test6 -ErrorAction SilentlyContinue
echo "[*] waiting for 6th plot to finish"
  
    while (!($nerad6 -eq $null)) {
    $nerad6 = Get-Process -Id $test6 -ErrorAction SilentlyContinue

    
    }

echo "[*] Plot 6 finished,starting it again"
start powershell {"C:\Users\Ploter02\Desktop\G3.ps1"}
start-sleep -s 60
$sesti = tasklist | Select-String -CaseSensitive -SimpleMatch chia   | Select-String -notmatch $prvi | Select-String -NotMatch $drugi | Select-String -NotMatch $treci | Select-String -NotMatch $peti | Select-String -NotMatch $cetvrti | Select-Object -First 1|Foreach {"$(($_ -split '\s+',4)[1..1])"}
}
echo "6th process is : $sesti"



$test1 = [System.Convert]::ToInt32($prvi,10)
$nerad1 = Get-Process -Id $test1 -ErrorAction SilentlyContinue
echo "[*] waiting for 6th plot to finish"
  
while (!($nerad1 -eq $null)) {
$nerad1 = Get-Process -Id $test1 -ErrorAction SilentlyContinue

    }   

echo "[*] 1st plot has finished"
$start = 0
}
