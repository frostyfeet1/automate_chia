$start = 1
for() {
echo "pokrecem plot"

#ovde pokrenuti prvi plot

start powershell {"C:\Users\Ploter1\Desktop\novi\plot_with_log.cmd"}
start-sleep -s 60
$prvi = tasklist | Select-String -CaseSensitive -SimpleMatch "chia_plot.exe"  | select-object -First 1|Foreach {"$(($_ -split '\s+',4)[1..1])"}
echo $prvi


#odavde provera

$test1 = [System.Convert]::ToInt32($prvi,10)
$nerad1 = Get-Process -Id $test1 -ErrorAction SilentlyContinue
echo "[*] ceka se da plot zavrsi"
  
while (!($nerad1 -eq $null)) {
$nerad1 = Get-Process -Id $test1 -ErrorAction SilentlyContinue


    }   
#dovde
echo "[*] plot je zavrsio"
#ovde promenite slovo za finalni hardisk
$disk = Get-WmiObject Win32_LogicalDisk  -Filter "DeviceID='M:'" | Select-Object Size,FreeSpace
$slobodno = $disk.FreeSpace/1GB
echo "na disku je slobodno"
echo $slobodno
if ($slobodno -lt 100){
echo "Finalni hard disk je pun"
echo "molimo promenite finalno odrediste za ploto u skripti plot_with_log.cmd"
echo "takodje pormenite slovo u ovoj skripti"
break
}
}
#posalji mail
#stavi svoje gmail
$From = "snederemail"
$To = "reciveremail"
$Subject = "Dodirni me,Promeni me"
$Body = "GUBIS NOVAC !!!!!!!!!!!!!!!!!"
$SMTPServer = "smtp.gmail.com"
$SMTPPort = "587"

#napravi  sifre
#nparavi cres.txt file u diretrorijumu gde je skripta i mad max
$username   = (Get-Content -Path '.\creds.txt')[0]
$password   = (Get-Content -Path '.\creds.txt')[1]
$secstr     = New-Object -TypeName System.Security.SecureString
$password.ToCharArray() | ForEach-Object {$secstr.AppendChar($_)}
$User = $username
$PWord = ConvertTo-SecureString $password -AsPlainText -Force
$Credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $User, $PWord

Send-MailMessage -From $From -to $To  -Subject $Subject `
-Body $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl `
-Credential $Credential
PAUSE
