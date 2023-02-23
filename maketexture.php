<?php
# make the colour palate textures using PHPGD
# run this with php-cli in the mod directory

for ($r=0; $r < 16; $r++) { 
    $img = imagecreatetruecolor(16,16);
    echo $r."\n";
    for ($g=0; $g < 16; $g++) { 
        for ($b=0; $b < 16; $b++) { 
            $hex = sprintf("%x%x%x%x%x%x",$r,$r,$g,$g,$b,$b);
            echo $hex."\n";
            imagesetpixel($img,$b,$g,hexdec($hex));
        }
    }
    imagepng($img,sprintf("textures/%xxx.png",$r));
    imagedestroy($img);
}