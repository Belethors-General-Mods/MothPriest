defmodule MothPriest.Format.Archive.BSA do
  require Logger

  alias MothPriest.Format.Archive.BSA.{TES2BSA, TES3BSA, TES4BSA, TES5BSA}

  def parse(path) do
    Logger.debug(path)
    data = File.read!(path)
    Logger.debug(inspect(parse_header(data)))
  end

  @spec parse_header(<<_::_*8>>) :: {module(), atom() | nil}
  def parse_header(data) do
    Logger.debug(inspect data)
    type =
      case data do
        <<"BSA\x00", "\x00\x00\x00\x69", _>> -> {TES5BSA, :se}
        <<"BSA\x00", "\x00\x00\x00\x68", _>> -> {TES5BSA, nil}
        <<"BSA\x00", "\x00\x00\x00\x67", _>> -> {TES4BSA, nil}
        <<"\x00\x01\x00\x00", _>> -> {TES3BSA, nil}
        <<_::8*2, "\x01\x00", _>> -> {TES2BSA, :ascii}
        <<_::8*2, "\x02\x00", _>> -> {TES2BSA, :recordid}
        _ -> raise "File is not a BSA"
      end
  end
end
