%sh{
    # foreground="rgb:c5c8c6"
    background="rgb:151515"
    selection="rgb:373b41"
    window="rgb:383838"
    text="rgb:e8e8d3"
    text_light="rgb:4E4E4E"
    line="rgb:282a2e"
    comment="rgb:969896"

    cyan="rgb:c6b6fe"
    purple="rgb:b294bb"
    green="rgb:99ad6a"
    green_dark="rgb:556633"
    red="rgb:de5577"
    orange="rgb:eeeeee"
    orange_light="rgb:f0c674"
    yellow="rgb:fad07a"
    magenta="rgb:a40063"
    magenta_dark="rgb:dd0093"

    ## code
    echo "
        face value ${orange}
        face type ${yellow}
        face variable ${magenta}
        face module ${green}
        face function ${aqua}
        face string ${green_dark}
        face keyword ${purple}
        face operator ${aqua}
        face attribute ${purple}
        face comment ${comment}
        face meta ${purple}
        face builtin ${orange}
    "

    ## markup
    echo "
        face title blue
        face header ${aqua}
        face bold ${yellow}
        face italic ${orange}
        face mono ${green_dark}
        face block ${orange}
        face link blue
        face bullet ${red}
        face list ${red}
    "

    ## builtin
    echo "
        face Default ${text},${background}
        face PrimarySelection default,${selection}
        face SecondarySelection default,${selection}
        face PrimaryCursor black,${aqua}
        face SecondaryCursor black,${aqua}
        face LineNumbers ${text_light},${background}
        face LineNumberCursor ${yellow},rgb:282828+b
        face MenuForeground ${text_light},blue
        face MenuBackground ${aqua},${window}
        face MenuInfo ${aqua}
        face Information white,${window}
        face Error white,${red}
        face StatusLine ${text},${window}
        face StatusLineMode ${yellow}+b
        face StatusLineInfo ${aqua}
        face StatusLineValue ${green_dark}
        face StatusCursor ${window},${aqua}
        face Prompt ${background},${aqua}
        face MatchingChar ${yellow},${background}+b
        face BufferPadding ${aqua},${background}
    "
}
