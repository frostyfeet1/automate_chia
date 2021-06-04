$start = 1
for() {echo "1"

#ovde pokrenuti prvi plot
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


#Start-Sleep -s 5
if ($start -eq 1)
{ 
  start-sleep -s 2400
  #pokreni drugi plot
  start powershell {"C:\Users\Ploter02\Desktop\F2.ps1"}
start-sleep -s 2400
  #ovde inicijaliziraj pid od plotova bez onih iskljucivanja ostalih
  $drugi = tasklist | Select-String -CaseSensitive -SimpleMatch chia  |Select-String -notmatch $prvi| select-object -First 1 |Foreach {"$(($_ -split '\s+',4)[1..1])"}
}

else{
 $test2 = [System.Convert]::ToInt32($drugi,10)
 $nerad2 = Get-Process -Id $test2 -ErrorAction SilentlyContinue
echo "[*] ceka se da drugi plot zavrsi"
  
    while (!($nerad2 -eq $null)) {
    $nerad2 = Get-Process -Id $test2 -ErrorAction SilentlyContinue
    #$nerad2 = Get-Process -Id 11111111 -ErrorAction SilentlyContinue
    
    }
#pokreni drugi plot
echo "[*] Plot 2 zavrsio ponovo pokrecem"
start powershell {"C:\Users\Ploter02\Desktop\F2.ps1"}
start-sleep -s 60
$drugi = tasklist | Select-String -CaseSensitive -SimpleMatch chia   | Select-String -notmatch $prvi | Select-String -notmatch $treci |Select-String -notmatch $cetvrti |Select-String -notmatch $sesti| Select-String -notmatch $peti | Select-Object -First 1 |Foreach {"$(($_ -split '\s+',4)[1..1])"}
}
echo "Pusi kurac vojo";
#promeni da drugi plot pid iskljucuje ostale pid od plotova
#$drugi = tasklist | Select-String -CaseSensitive -SimpleMatch chia  |Foreach {"$(($_ -split '\s+',4)[1..1])"} | Select-String -notmatch $prvi | Select-String -notmatch $treci |Select-String -notmatch $cetvrti |Select-String -notmatch $sesti Select-String -notmatch $peti | Select-Object -First 1 
echo "drugi proces je $drugi"
if ($start -eq 1)
{ 
start-sleep -s 2400
#pokreni treci plot
start powershell {"C:\Users\Ploter02\Desktop\F3.ps1"}
start-sleep -s 60
$treci = tasklist | Select-String -CaseSensitive -SimpleMatch chia   | Select-String -notmatch $prvi | Select-String -NotMatch $drugi  | Select-Object -First 1 |Foreach {"$(($_ -split '\s+',4)[1..1])"}
}
else{
 $test3 = [System.Convert]::ToInt32($treci,10)
 $nerad3 = Get-Process -Id $test3 -ErrorAction SilentlyContinue
echo "[*] ceka se da 3 plot zavrsi"
  
    while (!($nerad3 -eq $null)) {
    $nerad3 = Get-Process -Id $test3 -ErrorAction SilentlyContinue
    #$nerad2 = Get-Process -Id 11111111 -ErrorAction SilentlyContinue
    
    }
#pokreni treci plot
echo "[*] Plot 3 zavrsio ponovo pokrecem"
start powershell {"C:\Users\Ploter02\Desktop\F3.ps1"}
start-sleep -s 60
$treci = tasklist | Select-String -CaseSensitive -SimpleMatch chia   | Select-String -notmatch $prvi | Select-String -NotMatch $drugi | Select-String -notmatch $cetvrti | Select-String -notmatch $peti|  Select-String -NotMatch $sesti | Select-Object -First 1|Foreach {"$(($_ -split '\s+',4)[1..1])"}
}

#Start-Sleep -s 5

echo "treci proces je:$treci"
#start-sleep -s 5
if ($start -eq 1)
{ 
start-sleep -s 2400
#pokreni 4 plot
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
    #$nerad2 = Get-Process -Id 11111111 -ErrorAction SilentlyContinue
    
    }
#pokreni 4 plot
echo "[*] Plot 4 zavrsio ponovo pokrecem"
start powershell {"C:\Users\Ploter02\Desktop\G1.ps1"}
start-sleep -s 60
$cetvrti = tasklist | Select-String -CaseSensitive -SimpleMatch chia  | Select-String -notmatch $prvi | Select-String -NotMatch $drugi | Select-String -NotMatch $treci|  Select-String -NotMatch $peti | Select-String -NotMatch $sesti | Select-Object -First 1  |Foreach {"$(($_ -split '\s+',4)[1..1])"}
}

echo "cetvrti roc ke : $cetvrti"
#start-sleep -s 5
if ($start -eq 1)
{ 
start-sleep -s 2400
#pokreni 5 plot
start powershell {"C:\Users\Ploter02\Desktop\G2.ps1"}
start-sleep -s 60
$peti = tasklist | Select-String -CaseSensitive -SimpleMatch chia   | Select-String -notmatch $prvi | Select-String -NotMatch $drugi | Select-String -NotMatch $treci | Select-String -NotMatch $cetvrti | Select-Object -First 1|Foreach {"$(($_ -split '\s+',4)[1..1])"}
}
else{
 $test5 = [System.Convert]::ToInt32($peti,10)
 $nerad5 = Get-Process -Id $test5 -ErrorAction SilentlyContinue
echo "[*] ceka se da 5 plot zavrsi"
  
    while (!($nerad5 -eq $null)) {
    $nerad5 = Get-Process -Id $test5 -ErrorAction SilentlyContinue
    #$nerad2 = Get-Process -Id 11111111 -ErrorAction SilentlyContinue
    
    }
#pokreni 5 plot
echo "[*] Plot 5 zavrsio ponovo pokrecem"
start powershell {"C:\Users\Ploter02\Desktop\G2.ps1"}
start-sleep -s 60
$peti = tasklist | Select-String -CaseSensitive -SimpleMatch chia   | Select-String -notmatch $prvi | Select-String -NotMatch $drugi | Select-String -NotMatch $treci | Select-String -NotMatch $cetvrti| Select-String -NotMatch $sesti | Select-Object -First 1 |Foreach {"$(($_ -split '\s+',4)[1..1])"}
}

echo "peti : $peti"
#start-sleep -s 5
if ($start -eq 1)
{ 
start-sleep -s 2400
#pokreni 6 plot
start powershell {"C:\Users\Ploter02\Desktop\G3.ps1"}
start-sleep -s 60
$sesti = tasklist | Select-String -CaseSensitive -SimpleMatch chia  | Select-String -notmatch $prvi | Select-String -NotMatch $drugi | Select-String -NotMatch $treci | Select-String -NotMatch $peti | Select-String -NotMatch $cetvrti | Select-Object -First 1|Foreach {"$(($_ -split '\s+',4)[1..1])"}
}
else{
 $test6 = [System.Convert]::ToInt32($sesti,10)
 $nerad6 = Get-Process -Id $test6 -ErrorAction SilentlyContinue
echo "[*] ceka se da 6 plot zavrsi"
  
    while (!($nerad6 -eq $null)) {
    $nerad6 = Get-Process -Id $test6 -ErrorAction SilentlyContinue
    #$nerad2 = Get-Process -Id 11111111 -ErrorAction SilentlyContinue
    
    }
#pokreni treci plot
echo "[*] Plot 6 zavrsio ponovo pokrecem"
start powershell {"C:\Users\Ploter02\Desktop\G3.ps1"}
start-sleep -s 60
$sesti = tasklist | Select-String -CaseSensitive -SimpleMatch chia   | Select-String -notmatch $prvi | Select-String -NotMatch $drugi | Select-String -NotMatch $treci | Select-String -NotMatch $peti | Select-String -NotMatch $cetvrti | Select-Object -First 1|Foreach {"$(($_ -split '\s+',4)[1..1])"}
}
#$sesti = tasklist | Select-String -CaseSensitive -SimpleMatch chia  |Foreach {"$(($_ -split '\s+',4)[1..1])"} | Select-String -notmatch $prvi | Select-String -NotMatch $drugi | Select-String -NotMatch $treci | Select-String -NotMatch $peti | Select-String -NotMatch $cetvrti | Select-Object -First 1
echo "sesti : $sesti"

#odavde provera

$test1 = [System.Convert]::ToInt32($prvi,10)
$nerad1 = Get-Process -Id $test1 -ErrorAction SilentlyContinue
echo "[*] ceka se da prvi plot zavrsi"
  
while (!($nerad1 -eq $null)) {
$nerad1 = Get-Process -Id $test1 -ErrorAction SilentlyContinue
#$nerad = Get-Process -Id 1111111 -ErrorAction SilentlyContinue

    }   
#dovde
echo "[*] prvi plot je zavrsio"
$start = 0
}
