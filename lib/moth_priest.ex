defmodule MothPriest do
  @moduledoc """
  Documentation for MothPriest.
  """
  import MothPriest.Util.RegexCase

  alias MothPriest.Format.{Archive}

  @type supported_format() ::
          :bik
          | :bsa
          | :bsl
          | :dds
          | :esl
          | :esm
          | :esp
          | :ess
          | :flv
          | :ini
          | :lod
          | :nif
          | :pex
          | :sav
          | :wav
          | :xwm
          | :dlstrings
          | :ilstrings
          | :strings

  @spec read_scroll(String.t()) :: MothPriest.Scroll.t()
  @doc """

  """
  def read_scroll(path) do
    regex_case path do
      ~r/\.bik$/ -> read_scroll(path, :bik)
      ~r/\.bsa$/ -> read_scroll(path, :bsa)
      ~r/\.bsl$/ -> read_scroll(path, :bsl)
      ~r/\.dds$/ -> read_scroll(path, :dds)
      ~r/\.esl$/ -> read_scroll(path, :esl)
      ~r/\.esm$/ -> read_scroll(path, :esm)
      ~r/\.esp$/ -> read_scroll(path, :esp)
      ~r/\.ess$/ -> read_scroll(path, :ess)
      ~r/\.flv$/ -> read_scroll(path, :flv)
      ~r/\.ini$/ -> read_scroll(path, :ini)
      ~r/\.lod$/ -> read_scroll(path, :lod)
      ~r/\.nif$/ -> read_scroll(path, :nif)
      ~r/\.pex$/ -> read_scroll(path, :pex)
      ~r/\.sav$/ -> read_scroll(path, :sav)
      ~r/\.wav$/ -> read_scroll(path, :wav)
      ~r/\.xwm$/ -> read_scroll(path, :xwm)
      ~r/\.dlstrings$/ -> read_scroll(path, :dlstrings)
      ~r/\.ilstrings$/ -> read_scroll(path, :ilstrings)
      ~r/\.strings$/ -> read_scroll(path, :strings)
      ~r/.*/ -> {:error, :unknown_ext, "failed to guess file type from extension"}
    end
  end

  @spec read_scroll(String.t(), supported_format()) ::
          MothPriest.Scroll.t() | {:error, :not_implemented, String.t()}
  def read_scroll(_path, :bik), do: not_implemented("bik")
  def read_scroll(path, :bsa), do: Archive.BSA.parse(path)
  def read_scroll(_path, :bsl), do: not_implemented("bsl")
  def read_scroll(_path, :dds), do: not_implemented("dds")
  def read_scroll(_path, :esl), do: not_implemented("esl")
  def read_scroll(_path, :esm), do: not_implemented("esm")
  def read_scroll(_path, :esp), do: not_implemented("esp")
  def read_scroll(_path, :ess), do: not_implemented("ess")
  def read_scroll(_path, :flv), do: not_implemented("flv")
  def read_scroll(_path, :ini), do: not_implemented("ini")
  def read_scroll(_path, :lod), do: not_implemented("lod")
  def read_scroll(_path, :nif), do: not_implemented("nif")
  def read_scroll(_path, :pex), do: not_implemented("pex")
  def read_scroll(_path, :sav), do: not_implemented("sav")
  def read_scroll(_path, :wav), do: not_implemented("wav")
  def read_scroll(_path, :xwm), do: not_implemented("xwm")
  def read_scroll(_path, :strings), do: not_implemented("strings")
  def read_scroll(_path, :dlstrings), do: not_implemented("dlstrings")
  def read_scroll(_path, :ilstrings), do: not_implemented("ilstrings")

  defp not_implemented(format) do
    {:error, :not_implemented, "handling of `#{format}` files is not implemented yet"}
  end
end
