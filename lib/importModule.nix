# { defaultArgs }:
# entry:
# { ... }@userArgs:
# let
#   args = defaultArgs // userArgs;
# in
# entry args
args:
let importModule = entry: (import entry importModule args);
in importModule
