defmodule MothPriest.BaseTypes do
  @moduledoc """
  A utility module to hold type information about various low-level data types

  Higher level types are found in the places they are needed.
  """

  @typedoc """
  Generic meta-type used to group all the types in this file.
  """
  @type ctype(name, type) :: {name, type}

  @typedoc """
  Empty field.
  """
  @type null() :: ctype(:null, <<>>)

  @typedoc """
  8-bit integer, used to hold a single letter.

  The name `bchar()` is used because `char()` is a (different) reserved type.
  """
  @type bchar() :: ctype(:char, <<_::8>>)

  # NOTE it appears this type is currently unused
  # @typedoc """
  # 16-bit integer, typically used to hold a single letter.
  # """
  # @type wchar() :: <<_::16>>

  @typedoc """
  Signed 8-bit integer.
  """
  @type int8() :: ctype(:signed, <<_::8>>)

  @typedoc """
  Unsigned 8-bit integer.
  """
  @type uint8() :: ctype(:unsigned, <<_::8>>)

  @typedoc """
  Signed 16-bit integer.
  """
  @type int16() :: ctype(:signed, <<_::16>>)

  @typedoc """
  Unsigned 16-bit integer.
  """
  @type uint16() :: ctype(:unsigned, <<_::16>>)

  @typedoc """
  Signed 32-bit integer.
  """
  @type int32() :: ctype(:signed, <<_::32>>)

  @typedoc """
  Unsigned 32-bit integer.
  """
  @type uint32() :: ctype(:unsigned, <<_::32>>)

  @typedoc """
  Signed 64-bit integer.
  """
  @type int64() :: ctype(:signed, <<_::64>>)

  @typedoc """
  Unsigned 64-bit integer.
  """
  @type uint64() :: ctype(:unsigned, <<_::64>>)

  @typedoc """
  32-bit float.
  """
  @type float32() :: ctype(:float, <<_::32>>)

  @typedoc """
  64-bit float.
  """
  @type float64() :: ctype(:float, <<_::64>>)

  @typedoc """
  8-bit string with a 1-byte size prefix.
  """
  @type bstring() :: ctype(:bstring, <<_::_*8>>)

  @typedoc """
  8-bit string with a 1-byte size prefix and null terminator.
  """
  @type bzstring() :: ctype(:bzstring, <<_::_*8>>)

  @typedoc """
  8-bit string with a 2-byte size prefix.
  """
  @type wstring() :: ctype(:bstring, <<_::_*8>>)

  @typedoc """
  8-bit string with a 2-byte size prefix and null terminator.
  """
  @type wzstring() :: ctype(:bzstring, <<_::_*8>>)

  @typedoc """
  8-bit string with a 4-byte size prefix.
  """
  @type mstring() :: ctype(:mstring, <<_::_*8>>)

  @typedoc """
  8-bit string with a null terminator.
  """
  @type zstring() :: ctype(:zstring, <<_::_*8>>)

  @typedoc """
  Depending on the header, either the index of a localized string or a `zstring()`.
  """
  @type lstring() :: ctype(:lstring, <<_::32>>) | zstring()

  @typedoc """
  4-byte value containing red, green, blue, and (possibly) alpha values.
  """
  @type rgb() :: ctype(:rgb, <<_::4, _::_*8>>)

  @typedoc """
  8-byte value containing a BSA hash.
  """
  @type bsa_hash() :: ctype(:hash, <<_::8, _::_*8>>)
end
