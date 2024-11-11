require("glashnikov.remap")
require("glashnikov.packer")
require("glashnikov.set")

function GenerateRandomWordToBuffer(count)
  local result = ""
  local line_word_count = 0

  for i = 1, count do
    -- Execute the :RandomWord command and capture its output
    local output = vim.fn.execute('silent RandomWord')

    -- Extract the word between the single quotes in the output (e.g., print('word'))
    local word = output:match("'(.-)'")

    -- Ensure the word was successfully captured
    if word then
      -- Append the word to the result
      result = result .. word

      -- Add a space after each word except the last one
      if i < count then
        result = result .. " "
      end

      -- Increment the word count for the current line
      line_word_count = line_word_count + 1

      -- If the current line reaches 30 words, add a newline character
      if line_word_count == 30 then
        result = result .. "\n"
        line_word_count = 0
      end
    else
      -- If the word is nil, handle the error (this should not happen if RandomWord works correctly)
      print("Error: Could not extract word from output.")
      return
    end
  end

  -- Insert the generated text into the current buffer at the current cursor position
  vim.api.nvim_put(vim.split(result, "\n"), 'l', true, true)
end

vim.api.nvim_create_user_command(
  'GenerateWords',
  function(opts)
    GenerateRandomWordToBuffer(tonumber(opts.args))
  end,
  { nargs = 1 }
)
