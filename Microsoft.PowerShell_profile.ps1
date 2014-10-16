$scripts = "$(split-path $profile)\Scripts"
$modules = "$(split-path $profile)\Modules"
$docs    =  $(resolve-path "$Env:userprofile\documents")
$desktop =  $(resolve-path "$Env:userprofile\desktop")

Set-Alias rc Edit-PowershellProfile

function Prompt
{
    $mywd = (Get-Location).Path
    $mywd = $mywd.Replace( $HOME, '~' )
    Write-Host "PS " -NoNewline -ForegroundColor DarkGreen
    Write-Host ("" + $mywd + ">") -NoNewline -ForegroundColor Green
    return " "
}

function Edit-PowershellProfile
{
    notepad $Profile
}

function Write-ColorOutput($ForegroundColor)
{
    # save the current color
    $fc = $host.UI.RawUI.ForegroundColor

    # set the new color
    $host.UI.RawUI.ForegroundColor = $ForegroundColor

    # output
    if ($args) {
        Write-Output $args
    }
    else {
        $input | Write-Output
    }

    # restore the original color
    $host.UI.RawUI.ForegroundColor = $fc
}

function Color-LS
{
    dir $args | Format-High -Print {    
        $item = $args
        $fore = $host.UI.RawUI.ForegroundColor        
        $host.UI.RawUI.ForegroundColor = .{     
            if ($item[1].psIsContainer) {'Blue'}
            elseif ($item[1].Extension -match '\.(exe|bat|cmd|ps1|psm1|vbs|rb|reg|dll|o|lib)') {'Red'}
            elseif ($item[1].Extension -match '\.(zip|tar|gz|rar)') {'Yellow'}
            elseif ($item[1].Extension -match '\.(py|pl|cs|rb|h|cpp)') {'Cyan'}
            elseif ($item[1].Extension -match '\.(txt|cfg|conf|ini|csv|log|xml)') {'Green'}
            else {$fore}
        }
        write-host $args[0] -NoNewLine
        $host.UI.RawUI.ForegroundColor = $fore
    }
}