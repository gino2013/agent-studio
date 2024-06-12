# To learn more about how to use Nix to configure your environment
# see: https://developers.google.com/idx/guides/customize-idx-env
{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "stable-23.11"; # or "unstable"
  services.docker.enable = true;
  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.apt
    pkgs.jdk21
  ];
  # Sets environment variables in the workspace
  env = {};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      "redhat.java"
      "vscjava.vscode-java-debug"
      "vscjava.vscode-java-dependency"
      "vscjava.vscode-java-pack"
      "vscjava.vscode-java-test"
      "vscjava.vscode-maven"
      "Pivotal.vscode-boot-dev-pack"
      "vmware.vscode-spring-boot"
      "vscjava.vscode-spring-boot-dashboard"
      "vscjava.vscode-spring-initializr"
      "java-extension-pack-jdk"
    ];
    # Enable previews
    previews = {
      enable = false;
      # you can use 8080 
      # https://developers.google.com/idx/guides/troubleshooting
      # export port=4000 #dont use restricted ports (8000, 9000-9002)
      # export API_SERVICE="https://$port-$WEB_HOST"
      # echo $API_SERVICE
      # previews = {
      #   web = {
      #     # Example: run "npm run dev" with PORT set to IDX's defined port for previews,
      #     # and show it in IDX's web preview panel
      #     # command = ["npm" "run" "dev"];
      #     command = ["./gradlew" ":bootRun" "--args='--server.port=$PORT'"];
      #     manager = "web";
      #     env = {
      #       # Environment variables to set for your server
      #       PORT = "$PORT";
      #     };
      #   };
      # };
    };
    # Workspace lifecycle hooks
    workspace = {
      # Runs when a workspace is first created
      onCreate = {
        # Example: install JS dependencies from NPM
        # npm-install = "npm install";
      };
      # Runs when the workspace is (re)started
      onStart = {
        # Example: start a background task to watch and re-build backend code
        # watch-backend = "npm run watch-backend";
      };
    };
  };
}
