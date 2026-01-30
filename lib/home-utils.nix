{
  # Make entry for an user.
  mkUser =
    {
      username,
      name,
      shell,
      group,
      homeEntries,

      home ? "/home/${username}",
    }:

    {
      users.users.${username} = {
        inherit shell home;

        name = username;
        description = name;
        extraGroups = group;
        isNormalUser = true;
      };

      home-manager.users.${username} = {
        imports = homeEntries;
      };
    };
}
