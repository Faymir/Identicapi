defmodule Identicapi.Api.Identicon do
  @moduledoc """
  Documentation for Identicon.
  A module that allow you to generate identicons bases on a string passed as input.
  """
  alias Identicapi.Api.Identicon


  def main(input, width, height) when is_bitstring(width) do
    width = String.to_integer width
    height = String.to_integer height
    main(input, width, height)
  end

  def main(input, width, height) do
    input
      |> hash_input
      |> pick_color
      |> build_grid
      |> filter_odd_squares
      |> put_size(width, height)
      |> build_pixel_map
      |> draw_image
      #|> save_image(input)
  end


  def save_image(image,filename) do
    File.write("#{filename}.png", image)
  end

  def draw_image(%Identicon.Image{color: color, pixel_map: pixel_map} = image) do
    image = :egd.create(  image.widthB*image.total+image.paddingH  *  2,
                          image.heightB*image.total+image.paddingV *  2
                        )
    fillColor = :egd.color(color)
    Enum.each pixel_map, fn({start,stop}) ->
      :egd.filledRectangle(image,start,stop,fillColor)
    end

    :egd.render(image)
  end

  def put_size(image, width, height) do
    draw_width = width - image.paddingH * 2
    draw_height = height - image.paddingV * 2
    block_width = div(draw_width, 5)
    block_height = div(draw_height, 5)
    horizontal_padding = rem(draw_width, 5) + image.paddingH
    vertical_padding = rem(draw_height, 5) + image.paddingV

    %Identicon.Image{
        image |
        widthB: block_width,
        heightB: block_height,
        paddingH: horizontal_padding,
        paddingV: vertical_padding
      }

  end

  def build_pixel_map(%Identicon.Image{grid: grid} = image) do
    pixel_map =
      Enum.map grid, fn({_code, index}) ->
        horizontal = rem(index, image.total) * image.widthB
        vertical = div(index, image.total) * image.heightB

        top_left = {horizontal+image.paddingH, vertical+image.paddingV}
        bottom_right = {horizontal + image.widthB+image.paddingH, vertical + image.heightB+image.paddingV}

        {top_left, bottom_right}
      end

      %Identicon.Image{image | pixel_map: pixel_map}
  end

  def filter_odd_squares(%Identicon.Image{grid: grid} = image) do
    grid =  Enum.filter grid, fn({code, _index}) ->
              rem(code, 2) == 0
            end
    %Identicon.Image{image | grid: grid}
  end

  def build_grid(%Identicon.Image{hex: hex} = image) do

    grid =
      hex
      |>  my_chunk(3)
      |>  Enum.map(&mirror_row/1)
      |>  List.flatten
      |>  Enum.with_index

    %Identicon.Image{image | grid: grid}
  end

  defp my_chunk(enum, count) do
    enum
    |> Enum.chunk_every(count)
    |> Enum.drop(-1)
  end

  def mirror_row([first, second, _tail] = row) do
    row ++ [second, first]
  end

  def pick_color(%Identicon.Image{hex: [r,g,b | _tail]} = image) do #%{hex: [r,g,b | _tail]} = image
    %{image | color: {r,g,b}}
  end

  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
          |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end

end
