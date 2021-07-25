
for() {
echo "Starting plot"


start powershell {"C:\Users\Ploter1\Desktop\novi\plot_with_log.cmd"}
start-sleep -s 60
$prvi = tasklist | Select-String -CaseSensitive -SimpleMatch "chia_plot.exe"  | select-object -First 1|Foreach {"$(($_ -split '\s+',4)[1..1])"}
echo $prvi




$test1 = [System.Convert]::ToInt32($prvi,10)
$nerad1 = Get-Process -Id $test1 -ErrorAction SilentlyContinue
echo "[*] waiting for process to finish"
  
while (!($nerad1 -eq $null)) {
$nerad1 = Get-Process -Id $test1 -ErrorAction SilentlyContinue


    }   

echo "[*] Process finished"
echo "[*] Checking disk space"
#Here put disk letter on which are u storing your plots
$disk = Get-WmiObject Win32_LogicalDisk  -Filter "DeviceID='M:'" | Select-Object Size,FreeSpace
$slobodno = $disk.FreeSpace/1GB
echo "Disk has $slobondo space"
if ($slobodno -lt 100){
echo "Hard drive is full"
echo "Please change final destination for your plots in script plot_with_log.cmd"
echo "Also change hard drive letter in this script too"

break
}
}

$From = "snederemail"
$To = "reciveremail"
$Subject = "Chia Plots"
$Body = "Your hard drive is full"
$SMTPServer = "smtp.gmail.com"
$SMTPPort = "587"


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
