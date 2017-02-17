if ((Get-PSSnapin "Microsoft.SharePoint.PowerShell" -ErrorAction SilentlyContinue) -eq $null)
{
    Add-PSSnapin "Microsoft.SharePoint.PowerShell"
}

function PrintNavLinks($siteUrl){

    Try
     {
        $web = Get-SPWeb $siteUrl
        $pubWeb = [Microsoft.SharePoint.Publishing.PublishingWeb]::GetPublishingWeb($web)



        $qlNav = $pubWeb.Navigation.CurrentNavigationNodes

        ForEach ($nav in $qlNav) 
        {
             $output=""+$nav.Title+ " " + $nav.Url 
            Write-Output $output
            ForEach ($nav2 in $nav.Children) 
            {
                $output="`t"+$nav2.Title+ " " + $nav2.Url 
                 Write-Output $output
        
            }
        }

    }
    Catch [system.exception]
     {
      "caught a system exception"
     }
}

PrintNavLinks "site url"
