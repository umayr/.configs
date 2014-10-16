<#
.SYNOPSIS
    Formats input by columns using maximum suitable column number.

.DESCRIPTION
    Format-High prints the specified property, expression, or string
    representation of input objects filling the table by columns.

    It is named in contrast to Format-Wide which prints by rows.

.EXAMPLE
    # just items
    ls c:\windows | Format-High

    # ditto in colors based on PSIsContainer
    ls c:\windows | Format-High -Print {$c = if ($args[1].PSIsContainer) {'yellow'} else {'white'}; Write-Host $args[0] -ForegroundColor $c -NoNewline}

    # just processes, not good
    ps | Format-High

    # process names, much better
    ps | Format-High Name

    # custom expression and width
    ps | Format-High {$_.Name + ':' + $_.WS} 70

    # process names in colors based on working sets
    ps | Format-High Name 70 {$c = if ($args[1].WS -gt 10mb) {'red'} else {'green'}; Write-Host $args[0] -ForegroundColor $c -NoNewline}
#>

param
(
    [object]$Property,
    [int]$Width = $Host.UI.RawUI.WindowSize.Width - 1,
    [scriptblock]$Print = { Write-Host $args[0] -NoNewline },
    [object[]]$InputObject
)

# process the input, get strings to format
if ($InputObject -eq $null) { $InputObject = @($input) }
if ($Property -is [string]) { $strings = $InputObject | Select-Object -ExpandProperty $Property }
elseif ($Property -is [scriptblock]) { $strings = $InputObject | ForEach-Object $Property }
else { $strings = $InputObject }
$strings = @(foreach($_ in $strings) { "$_" })

# pass 1: find the maximum column number
$nbest = 1
$bestwidths = @($Width)
for($ncolumn = 2; ; ++$ncolumn) {
    $nrow = [Math]::Ceiling($strings.Count / $ncolumn)
    $widths = @(
        for($s = 0; $s -lt $strings.Count; $s += $nrow) {
            $e = [Math]::Min($strings.Count, $s + $nrow)
            ($strings[$s .. ($e - 1)] | Measure-Object -Maximum Length).Maximum + 1
        }
    )
    if (($widths | Measure-Object -Sum).Sum -gt $Width) {
        break
    }
    $bestwidths = $widths
    $nbest = $ncolumn
    if ($nrow -le 1) {
        break
    }
}

# pass 2: print strings
$nrow = [Math]::Ceiling($strings.Count / $nbest)
for($r = 0; $r -lt $nrow; ++$r) {
    for($c = 0; $c -lt $nbest; ++$c) {
        $i = $c * $nrow + $r
        if ($i -lt $strings.Count) {
            & $Print ($strings[$i].PadRight($bestwidths[$c])) $InputObject[$i]
        }
    }
    & $Print "`r`n"
}