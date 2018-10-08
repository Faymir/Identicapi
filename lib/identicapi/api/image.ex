defmodule Identicapi.Api.Identicon.Image do
  @moduledoc """
    This module define the structure of the image Used by the
    Identicon module to generate a png image of 250x250 by default with a padding of 15
    Images are made of 5x5 blocks of colour
    `widthB`  represent the width of little block of color
    `heightB` represent the width of little block of color
    So WidthB * total + padding * 2 = 250 (left padding + right padding)
  """
  defstruct hex: nil,
            color: nil,
            grid: nil,
            pixel_map: nil,
            widthB: 44, #width of a block of color
            heightB: 44, #height of a block of color
            total: 5, #Number of blocks
            paddingH: 15, # Horizontal padding (left and right)
            paddingV: 15  # Vertical padding (top and bottom)
end
