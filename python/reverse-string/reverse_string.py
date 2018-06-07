def reverse(input: str = '') -> str:
  def go(input: str, output: str) -> str:
    if input == '':
      return output

    return go(input[1:], input[0] + output)

  return go(input, '')
