# Write a short program that reads its own source code (search StackOverflow to find out how to get the name of the currently executed file) and prints it on the screen.

# quine – it is a program that prints its own source code, usually to the standard output. It has to store its source code in itself (it cannot rely on the source file laying around on the file system).

# The classic way to produce a self-printing program has two steps.

# Initialize a string variable, with a placeholder for interpolation.
# Print the string, interpolating the string into itself.

  s="s=%p;puts s%%s";puts s%s


