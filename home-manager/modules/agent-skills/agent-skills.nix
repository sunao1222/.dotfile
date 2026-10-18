{ inputs, ... }:
{
  imports = [
    inputs.agent-skills.homeManagerModules.default
  ];

  programs.agent-skills = {
    enable = true;
    targets.opencode.enable = true;
    sources.i-have-adhd = {
      input = "i-have-adhd";
      subdir = "skills";
    };
    sources.my-skills = {
      input = "my-skills";
      subdir = "skills";
      idPrefix = "my-skills";
    };
    sources.awesome-copilot = {
      input = "awesome-copilot";
      subdir = "skills";
      idPrefix = "awesome-copilot";
    };
    sources.anthropic = {
      input = "anthropic-skills";
      subdir = "skills";
      idPrefix = "anthropic";
    };
    skills.enable = [
      "my-skills/nix-development"
      "awesome-copilot/gh-attach"
      "awesome-copilot/git-commit"
      "awesome-copilot/git-flow-branch-creator"
      "awesome-copilot/refactor"
      "awesome-copilot/security-review"
      "anthropic/skill-creator"
      "anthropic/webapp-testing"
    ];
  };
}
