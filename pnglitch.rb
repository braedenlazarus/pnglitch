require 'pnglitch'

# Open the glitched image
png = PNGlitch.open('challenge.png')

# Define the reverse transpose process
reverse_transpose = lambda do |data|
    x = data.size / 4

    # Extract each quarter based on the transpose pattern used in the original script
    first_quarter = data[0, x]
    third_quarter = data[x, x]
    second_quarter = data[x * 2, x]
    fourth_quarter = data[x * 3.. -1]

    # Restore to original order: 1, 2, 3, 4
    restored_data = first_quarter + second_quarter + third_quarter + fourth_quarter
    restored_data
end

# Apply the reverse transpose process on the filtered data
png.glitch do |data|
    reverse_transpose.call(data)
end

# Save the restored image
png.save('restored.png')
png.close