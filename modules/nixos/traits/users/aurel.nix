{
  config,
  lib,
  secretsDir,
  ...
}: 
let
cfg = traits.users.aurel;
in
{
  options.traits.users.aurel = {
    manageSecrets =
      lib.mkEnableOption "automatic management of secrets"
      // {
        default = config.traits.secrets.enable;
        defaultText = lib.literalExpression "config.traits.secrets.enable";
      };
  };

  config = lib.mkMerge [
    
       (lib.mkIf (cfg.enable && cfg.manageSecrets) {
      age.secrets = {
        aurelPassword.file = secretsDir + "/aurelPassword.age";
      };

      users.users.aurel = {
        hashedPasswordFile = lib.mkDefault config.age.secrets.aurelPassword.path;
      };
    })
  
  ];
}
