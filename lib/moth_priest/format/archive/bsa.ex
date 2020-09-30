defmodule MothPriest.Format.Archive.BSA do
  require Logger

  alias MothPriest.Format.Archive.BSA.{TES2BSA, TES3BSA, TES4BSA, TES5BSA}

  def parse(path) do
    Logger.debug(path)
    file = File.open!(path)
    bytes = IO.binread(file, 8)
    Logger.debug(inspect(parse_header(bytes)))
  end

  @spec parse_header(<<_::_*8>>) :: {module(), atom() | nil}
  def parse_header(data) do
    Logger.debug(inspect data)
    type =
      case data do
        <<"BSA\x00", "\x69\x00\x00\x00">> -> {TES5BSA, :se}
        <<"BSA\x00", "\x68\x00\x00\x00">> -> {TES5BSA, nil}
        <<"BSA\x00", "\x67\x00\x00\x00">> -> {TES4BSA, nil}
        <<"\x00\x01\x00\x00", _::8*4>> -> {TES3BSA, nil}
        <<_::8*2, "\x01\x00", _::8*4>> -> {TES2BSA, :ascii}
        <<_::8*2, "\x02\x00", _::8*4>> -> {TES2BSA, :recordid}
        _ -> raise "File is not a BSA"
      end
  end
end
