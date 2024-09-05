/*
   let
  toSecrets = import ./toSecrets.nix;

  owners = {
    aurreland = "";
  };

  hosts = {
    demeter = {
      #owner = owners.aurreland;
      pubkey = "ssh-ecdsa AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAGfjgmOnpPhuXJQ4O1IwecTHFjbkbhNxtN7aH1YzWx7+PLkT8K6wk9vHUb87dJh5uwOKC3eXhEh1ONUrKvFeCl4uQCdnJBgSFIcP+aNpndBxyV1aV7CjZ44YEeQphNofCB/193m5gBzQJE50Bw6B/xSrRPaz5jMWwhnbRzsiRPKt1jBOA==";
      files = ["aurelPassword.age"];
    };
  };
in
  toSecrets hosts
*/
{
  "demeter/aurelPassword.age".publicKeys = ["ssh-ecdsa AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAGfjgmOnpPhuXJQ4O1IwecTHFjbkbhNxtN7aH1YzWx7+PLkT8K6wk9vHUb87dJh5uwOKC3eXhEh1ONUrKvFeCl4uQCdnJBgSFIcP+aNpndBxyV1aV7CjZ44YEeQphNofCB/193m5gBzQJE50Bw6B/xSrRPaz5jMWwhnbRzsiRPKt1jBOA=="];
}
