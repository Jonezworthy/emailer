param (
   [string]$to
   , [string]$subject
   , [string]$body
   
)

$to = "$($to)@DOMAIN.co.uk"; #change


$signatureContent = [IO.File]::ReadAllText("C:\Users\AndrewJ\AppData\Roaming\Microsoft\Signatures\BasicSig.htm"); #change
$password = [IO.File]::ReadAllText("C:\dev_scripts\credentials.txt"); #change

if ($to.length -gt 0 -And $subject.length -gt 0 -And $body.length -gt 0){

	

	$smtp = New-Object Net.Mail.SmtpClient("exch01")#change

	$credentials = New-Object Net.NetworkCredential("andrewj", $password)#change
	$smtp.Credentials = $credentials
	$smtp.EnableSsl = "true"

	$objMailMessage = New-Object System.Net.Mail.MailMessage
	$objMailMessage.IsBodyHTML = $true
	$objMailMessage.From = "email address"#change
	$objMailMessage.To.Add($to)
	$objMailMessage.Subject = $subject
	$objMailMessage.Body = "
		<div class=MsoAutoSig><span style='font-size:10.0pt;font-family:'Nirmala UI',sans-serif'>
		$($body)
		</div>
		<br /> 
		<br /> 

		$($signatureContent)
		"

	$smtp.send($objMailMessage)

}