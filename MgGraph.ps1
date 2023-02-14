# Set the number of days (180 in this case)
$DaysOld = 180

# Get the current date
$CurrentDate = Get-Date

# Connect to the Microsoft Graph API
Connect-MgGraph -Scopes "User.Read.All"

# Get all blocked Office 365 users
$BlockedUsers = Get-MgUser -Filter "accountEnabled eq false"

# Filter users based on when their accounts were created
$OldBlockedUsers = $BlockedUsers | Where-Object {($CurrentDate - $_.WhenCreated.DateTime).Days -gt $DaysOld}

# Display the results
$OldBlockedUsers | Select-Object DisplayName, UserPrincipalName, WhenCreated, AccountEnabled
