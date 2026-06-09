Add-Type -AssemblyName System.Drawing

$brandKitPath = "assets\vellano_brandkit.png"
if (-not (Test-Path $brandKitPath)) {
    Write-Host "Brand kit not found."
    exit
}

$brandKitImg = [System.Drawing.Image]::FromFile($brandKitPath)

# 1. Extract Wordmark (Top Half)
$wmRect = New-Object System.Drawing.Rectangle(0, 0, $brandKitImg.Width, [math]::Floor($brandKitImg.Height / 2))
$wordmarkBitmap = New-Object System.Drawing.Bitmap($wmRect.Width, $wmRect.Height)
$gWM = [System.Drawing.Graphics]::FromImage($wordmarkBitmap)
$gWM.DrawImage($brandKitImg, (New-Object System.Drawing.Rectangle(0, 0, $wmRect.Width, $wmRect.Height)), $wmRect, [System.Drawing.GraphicsUnit]::Pixel)
$gWM.Dispose()

# ColorMatrix for White Logo on Transparent Background
[float[][]] $matrixWhite = @(
    @(0.0, 0.0, 0.0, -1.0, 0.0),
    @(0.0, 0.0, 0.0,  0.0, 0.0),
    @(0.0, 0.0, 0.0,  0.0, 0.0),
    @(0.0, 0.0, 0.0,  0.0, 0.0),
    @(1.0, 1.0, 1.0,  1.0, 1.0)
)
$iaWhite = New-Object System.Drawing.Imaging.ImageAttributes
$iaWhite.SetColorMatrix((New-Object System.Drawing.Imaging.ColorMatrix(,$matrixWhite)))

# ColorMatrix for Black Logo on Transparent Background
[float[][]] $matrixBlack = @(
    @(0.0, 0.0, 0.0, -1.0, 0.0),
    @(0.0, 0.0, 0.0,  0.0, 0.0),
    @(0.0, 0.0, 0.0,  0.0, 0.0),
    @(0.0, 0.0, 0.0,  0.0, 0.0),
    @(0.0, 0.0, 0.0,  1.0, 1.0)
)
$iaBlack = New-Object System.Drawing.Imaging.ImageAttributes
$iaBlack.SetColorMatrix((New-Object System.Drawing.Imaging.ColorMatrix(,$matrixBlack)))

# Save standalone logos for Header/Footer
$whiteLogo = New-Object System.Drawing.Bitmap($wordmarkBitmap.Width, $wordmarkBitmap.Height)
$gWhite = [System.Drawing.Graphics]::FromImage($whiteLogo)
$gWhite.DrawImage($wordmarkBitmap, (New-Object System.Drawing.Rectangle(0, 0, $whiteLogo.Width, $whiteLogo.Height)), 0, 0, $wordmarkBitmap.Width, $wordmarkBitmap.Height, [System.Drawing.GraphicsUnit]::Pixel, $iaWhite)
$gWhite.Dispose()
$whiteLogo.Save("assets\vellano_logo_white.png", [System.Drawing.Imaging.ImageFormat]::Png)
$whiteLogo.Dispose()

$blackLogo = New-Object System.Drawing.Bitmap($wordmarkBitmap.Width, $wordmarkBitmap.Height)
$gBlack = [System.Drawing.Graphics]::FromImage($blackLogo)
$gBlack.DrawImage($wordmarkBitmap, (New-Object System.Drawing.Rectangle(0, 0, $blackLogo.Width, $blackLogo.Height)), 0, 0, $wordmarkBitmap.Width, $wordmarkBitmap.Height, [System.Drawing.GraphicsUnit]::Pixel, $iaBlack)
$gBlack.Dispose()
$blackLogo.Save("assets\vellano_logo_black.png", [System.Drawing.Imaging.ImageFormat]::Png)
$blackLogo.Dispose()

# Stamp the White Wordmark onto Product Images
$imagesToStamp = @("assets\vellano_product_hero.png", "assets\filter_refills.png", "assets\vellano_suds.png", "assets\after_showerhead.png", "assets\vellano_water_flow.png")

foreach ($imgPath in $imagesToStamp) {
    if (Test-Path $imgPath) {
        $prodImg = [System.Drawing.Image]::FromFile($imgPath)
        $bmp = New-Object System.Drawing.Bitmap($prodImg.Width, $prodImg.Height)
        $g = [System.Drawing.Graphics]::FromImage($bmp)
        
        # High quality rendering
        $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
        $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
        
        # Draw original
        $g.DrawImage($prodImg, 0, 0, $prodImg.Width, $prodImg.Height)
        
        # Calculate watermark size (e.g. 50% of width)
        $wmTargetWidth = [math]::Floor($prodImg.Width * 0.5)
        $wmTargetHeight = [math]::Floor($wordmarkBitmap.Height * ($wmTargetWidth / $wordmarkBitmap.Width))
        $wmX = [math]::Floor(($prodImg.Width - $wmTargetWidth) / 2)
        $wmY = [math]::Floor(($prodImg.Height - $wmTargetHeight) / 2)
        
        $destRect = New-Object System.Drawing.Rectangle($wmX, $wmY, $wmTargetWidth, $wmTargetHeight)
        
        # Draw white watermark with transparency overlay
        # Since we use iaWhite, black becomes opaque white, and white becomes transparent.
        # But wait, we might want some transparency (opacity=0.8). 
        # For simplicity, 100% white is fine.
        $g.DrawImage($wordmarkBitmap, $destRect, 0, 0, $wordmarkBitmap.Width, $wordmarkBitmap.Height, [System.Drawing.GraphicsUnit]::Pixel, $iaWhite)
        
        $g.Dispose()
        $prodImg.Dispose()
        
        # Overwrite
        $bmp.Save($imgPath, [System.Drawing.Imaging.ImageFormat]::Png)
        $bmp.Dispose()
        Write-Host "Stamped $imgPath"
    }
}

$wordmarkBitmap.Dispose()
$brandKitImg.Dispose()
Write-Host "Done"
